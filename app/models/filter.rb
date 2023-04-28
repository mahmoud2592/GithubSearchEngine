class Filter < ApplicationRecord
  has_many :filter_values
  has_many :search_filters
end
