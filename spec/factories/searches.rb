FactoryBot.define do
  factory :search do
    # user { nil }
    name { "MyString" }
    description { "MyStrings" }
    keyword { "MyString" }
    timestamp { "2023-04-28 01:19:18" }
    total_count { 1 }
    incomplete_results { false }
    github_search_id { 1 }
  end
end
