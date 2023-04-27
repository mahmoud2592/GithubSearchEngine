FactoryBot.define do
  factory :tag do
    name { "MyString" }
    commit_sha { "MyString" }
    tagger_name { "MyString" }
    tagger_email { "MyString" }
    message { "MyText" }
    github_tag_id { 1 }
  end
end
