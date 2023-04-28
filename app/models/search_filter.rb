class SearchFilter < ApplicationRecord
  belongs_to :search
  belongs_to :filter
  belongs_to :filter_value

  validates :search_id, presence: true
  validates :filter_id, presence: true
  validates :filter_value_id, presence: true

  # Add an index to the search_id column
  # index :search_id

  # Add an index to the filter_id column
  # index :filter_id

  # Add an index to the filter_value_id column
  # index :filter_value_id

  scope :with_filter_value, ->(filter_value_id) { where(filter_value_id: filter_value_id) }

end
