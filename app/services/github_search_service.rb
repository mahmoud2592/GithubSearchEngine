class GithubSearchService
  BASE_URL = "https://api.github.com/search/repositories"

  def self.search_repositories(query, sort, page)
    url = "#{BASE_URL}?q=#{query}&sort=#{sort}&page=#{page}"
    response = HTTParty.get(url)
    response['items']
  end
end
