# app/models/sorting_option.rb
class SortingOption < ApplicationRecord
  enum direction: { asc: 'asc', desc: 'desc' }

  has_many :search_sorting_options, dependent: :destroy
  belongs_to :search

  validates :name, presence: true, uniqueness: true

  scope :default, -> { where(default: true) }

  def to_query_string
    "#{name}_#{direction}"
  end
end
