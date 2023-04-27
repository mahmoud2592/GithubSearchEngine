FactoryBot.define do
  factory :user do
    username { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    avatar_url { "MyString" }
    location { "MyString" }
    bio { "MyText" }
    followers_count { 1 }
    following_count { 1 }
    public_repos_count { 1 }
    github_user_id { 1 }
  end
end
