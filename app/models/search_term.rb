# app/models/search_term.rb
class SearchTerm < ApplicationRecord
  # belongs_to :user

  validates :term, presence: true

  def usage_count
    Search.where('keyword LIKE ?', "%#{term}%").count
  end

  def self.popular_terms(limit)
    group(:term).order(Arel.sql('COUNT(*) DESC')).limit(limit).count.keys
  end

  def self.increment_count(term)
    search_term = find_or_initialize_by(term: term)
    search_term.count += 1
    search_term.save
  end
end
