# app/models/search_sorting_option.rb
class SearchSortingOption < ApplicationRecord
  belongs_to :search
  belongs_to :sorting_option

  validates :count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :value, presence: true
  # validates :label, presence: true

  def increment_count
    update(count: count + 1)
  end

  # Add an index to the sorting_option_id column
  # index :sorting_option_id

  def self.most_used(limit)
    joins(:sorting_option).group('sorting_options.name').order(Arel.sql('SUM(search_sorting_options.count) DESC')).limit(limit).pluck('sorting_options.name')
  end
end
