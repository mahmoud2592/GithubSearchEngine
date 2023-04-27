FactoryBot.define do
  factory :repository do
    name { "MyString" }
    description { "MyText" }
    owner { "MyString" }
    url { "MyString" }
    is_search_result { false }
    stars_count { 1 }
    forks_count { 1 }
    open_issues_count { 1 }
    default_branch { "MyString" }
    created_at { "2023-04-28 01:19:07" }
    updated_at { "2023-04-28 01:19:07" }
    pushed_at { "2023-04-28 01:19:07" }
    github_repo_id { 1 }
  end
end
