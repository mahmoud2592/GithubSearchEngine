class SearchForm
  include ActiveModel::Model

  attr_accessor :name, :description, :filter_ids, :sorting_option_ids

  validates :name, presence: true

  def initialize(search = nil)
    @search = search
    @filter_ids = search&.filter_ids || []
    @sorting_option_ids = search&.sorting_option_ids || []
  end

  def save
    return false unless valid?

    if @search.nil?
      @search = Search.create(name: name, description: description)
    else
      @search.update(name: name, description: description)
      @search.filters.clear
      @search.sorting_options.clear
    end

    @search.filters = Filter.where(id: filter_ids)
    @search.sorting_options = SortingOption.where(id: sorting_option_ids)

    @search.save
  end
end
