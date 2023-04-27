class CreateCommits < ActiveRecord::Migration[7.0]
  def change
    create_table :commits do |t|
      t.references :repository, null: false, foreign_key: true
      t.text :message
      t.string :author
      t.datetime :timestamp
      t.string :sha
      t.string :url
      t.text :added
      t.text :removed
      t.text :modified
      t.text :parent_shas
      t.integer :github_commit_id

      t.datetime :system_created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :system_updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
