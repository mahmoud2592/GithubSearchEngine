class FilterValue < ApplicationRecord
  belongs_to :filter
  has_many :search_filters, dependent: :destroy

  validates :value, presence: true
  # Add an index to the filter_id column
  # index :filter_id
end
