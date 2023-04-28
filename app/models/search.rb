class Search < ApplicationRecord
  has_many :search_filters
  has_many :search_sorting_options
  belongs_to :user
end
