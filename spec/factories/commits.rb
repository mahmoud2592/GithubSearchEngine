FactoryBot.define do
  factory :commit do
    repository { nil }
    message { "MyText" }
    author { "MyString" }
    timestamp { "2023-04-28 01:19:10" }
    sha { "MyString" }
    url { "MyString" }
    added { "MyText" }
    removed { "MyText" }
    modified { "MyText" }
    parent_shas { "MyText" }
    github_commit_id { 1 }
  end
end
