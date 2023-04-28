class Search < ApplicationRecord
  has_many :search_filters, dependent: :destroy
  has_many :filters, through: :search_filters
  has_many :search_sorting_options, dependent: :destroy
  has_many :sorting_options, through: :search_sorting_options

  validates :name, presence: true
  validates :keyword, presence: true
  validate :validate_filters_and_sorting

  serialize :filters_and_sorting, Hash

  before_validation :set_keyword

  def query
    build_query(keyword, filters, sorting_options)
  end

  def sort
    sorting_options.pluck(:name).join(',')
  end

  def search_results(page)
    GithubSearchService.search_repositories(query, sort, page)
  end

  def available_filters
    # Filter.select(:id, :name).map(&:attributes)
    Filter.all.map { |f| { id: f.id, name: f.name } }
  end

  def available_sorting_options
    SortingOption.all.map { |sorting_option| { id: sorting_option.id, name: sorting_option.name } }
  end

  def popular_search_terms(limit)
    SearchTerm.group(:term).order('count_id DESC').limit(limit).count(:id).keys
  end

  private

  def set_keyword
    self.keyword = [name, description].compact.join(' ')
  end

  def validate_filters_and_sorting
    return if filters_and_sorting.blank?

    filters_and_sorting.each do |key, value|
      case key
      when 'filters'
        validate_filters(value)
      when 'sorting_options'
        validate_sorting_options(value)
      else
        errors.add(:filters_and_sorting, "contains invalid key: #{key}")
      end
    end
  end

  def validate_filters(filters)
    filters.each do |key, value|
      filter = Filter.find_by(name: key)
      if filter.nil?
        errors.add(:filters_and_sorting, "contains invalid filter key: #{key}")
      else
        if value.is_a?(Array)
          value.each do |v|
            validate_filter_value(filter, v)
          end
        else
          validate_filter_value(filter, value)
        end
      end
    end
  end

  def validate_filter_value(filter, value)
    return if filter.filter_values.exists?(value: value)

    errors.add(:filters_and_sorting, "contains invalid value for filter #{filter.name}: #{value}")
  end

  def validate_sorting_options(sorting_options)
    sorting_options.each do |option|
      sorting_option = SortingOption.find_by(name: option)
      errors.add(:filters_and_sorting, "contains invalid sorting option: #{option}") if sorting_option.nil?
    end
  end

  def build_query(keyword, filters, sorting_options)
    query = keyword

    filters.each do |filter|
      filter_values = filter.filter_values.pluck(:value)
      query += " #{filter.name}:#{filter_values.join(',')}" unless filter_values.empty?
    end

    query += " sort:#{sort}" unless sorting_options.empty?

    query
  end
end
