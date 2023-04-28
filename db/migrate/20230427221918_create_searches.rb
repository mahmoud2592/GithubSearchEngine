class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      # t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :keyword
      t.datetime :timestamp
      t.integer :total_count
      t.boolean :incomplete_results
      t.integer :github_search_id

      t.datetime :system_created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :system_updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
