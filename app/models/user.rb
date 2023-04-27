class User < ApplicationRecord
  has_many :searchs
  has_many :search_terms
end
