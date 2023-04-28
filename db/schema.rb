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

ActiveRecord::Schema[7.0].define(version: 2023_04_28_063823) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "search_filters", force: :cascade do |t|
    t.bigint "search_id", null: false
    t.bigint "filter_id", null: false
    t.bigint "filter_value_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filter_id"], name: "index_search_filters_on_filter_id"
    t.index ["filter_value_id"], name: "index_search_filters_on_filter_value_id"
    t.index ["search_id"], name: "index_search_filters_on_search_id"
  end

  create_table "search_sorting_options", force: :cascade do |t|
    t.bigint "search_id", null: false
    t.bigint "sorting_option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count", default: 0, null: false
    t.index ["search_id"], name: "index_search_sorting_options_on_search_id"
    t.index ["sorting_option_id"], name: "index_search_sorting_options_on_sorting_option_id"
  end

  create_table "search_terms", force: :cascade do |t|
    t.string "term"
    t.datetime "timestamp"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "keyword"
    t.datetime "timestamp"
    t.integer "total_count"
    t.boolean "incomplete_results"
    t.integer "github_search_id"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "sorting_options", force: :cascade do |t|
    t.string "name"
    t.string "direction"
    t.string "field"
    t.integer "github_sorting_option_id"
    t.datetime "system_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "system_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  add_foreign_key "filter_values", "filters"
  add_foreign_key "search_filters", "filter_values"
  add_foreign_key "search_filters", "filters"
  add_foreign_key "search_filters", "searches"
  add_foreign_key "search_sorting_options", "searches"
  add_foreign_key "search_sorting_options", "sorting_options"
end
