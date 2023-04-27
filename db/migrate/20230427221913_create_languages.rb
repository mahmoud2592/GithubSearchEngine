class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :color
      t.string :url
      t.integer :github_language_id

      t.datetime :system_created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :system_updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
