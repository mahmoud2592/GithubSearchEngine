class SearchFilter < ApplicationRecord
  belongs_to :search
  belongs_to :filter
  belongs_to :filter_value
end
