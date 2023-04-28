class Filter < ApplicationRecord
  has_many :filter_values, dependent: :destroy
  has_many :search_filters, dependent: :destroy

  belongs_to :search

  validates :name, presence: true

  # Add an index to the name column
  # index :name

  scope :with_filter_values, -> { includes(:filter_values) }
end


