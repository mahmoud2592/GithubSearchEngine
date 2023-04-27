class CreateRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.text :description
      t.string :owner
      t.string :url
      t.boolean :is_search_result
      t.integer :stars_count
      t.integer :forks_count
      t.integer :open_issues_count
      t.string :default_branch
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :pushed_at
      t.integer :github_repo_id

      t.datetime :system_created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :system_updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
