class SearchResultsPresenter
  attr_reader :results

  def initialize(results)
    @results = results
  end

  def present
    @results.map do |result|
      {
        name: result['full_name'],
        description: result['description'],
        url: result['html_url'],
        owner: result['owner']['login'],
        language: result['language'],
        stars: result['stargazers_count'],
        forks: result['forks_count'],
        created_at: result['created_at'],
        updated_at: result['updated_at']
      }
    end
  end
end
