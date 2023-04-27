# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_27_221930) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commits", force: :cascade do |t|
    t.bigint "repository_id", null: false
    t.text "message"
    t.string "author"
    t.datetime "timestamp"
    t.string "sha"
    t.string "url"
    t.text "added"
    t.text "removed"
    t.text "modified"
    t.text "parent_shas"
    t.integer "github_commit_id"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["repository_id"], name: "index_commits_on_repository_id"
  end

  create_table "filter_values", force: :cascade do |t|
    t.bigint "filter_id", null: false
    t.string "value"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["filter_id"], name: "index_filter_values_on_filter_id"
  end

  create_table "filters", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "label"
    t.string "url"
    t.integer "github_filter_id"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "url"
    t.integer "github_language_id"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "owner"
    t.string "url"
    t.boolean "is_search_result"
    t.integer "stars_count"
    t.integer "forks_count"
    t.integer "open_issues_count"
    t.string "default_branch"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "pushed_at"
    t.integer "github_repo_id"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "search_terms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "term"
    t.datetime "timestamp"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["user_id"], name: "index_search_terms_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "keyword"
    t.datetime "timestamp"
    t.integer "total_count"
    t.boolean "incomplete_results"
    t.integer "github_search_id"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "sorting_options", force: :cascade do |t|
    t.string "name"
    t.string "direction"
    t.string "field"
    t.integer "github_sorting_option_id"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "commit_sha"
    t.string "tagger_name"
    t.string "tagger_email"
    t.text "message"
    t.integer "github_tag_id"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "avatar_url"
    t.string "location"
    t.text "bio"
    t.integer "followers_count"
    t.integer "following_count"
    t.integer "public_repos_count"
    t.integer "github_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "commits", "repositories"
  add_foreign_key "filter_values", "filters"
  add_foreign_key "search_terms", "users"
  add_foreign_key "searches", "users"
end
