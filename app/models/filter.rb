class Filter < ApplicationRecord
  has_many :filter_values, dependent: :destroy
  has_many :search_filters, dependent: :destroy

  validates :name, presence: true


