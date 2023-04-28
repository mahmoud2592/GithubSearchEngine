class CreateSearchTerms < ActiveRecord::Migration[7.0]
  def change
    create_table :search_terms do |t|
      # t.references :user, null: false, foreign_key: true
      t.string :term
      t.datetime :timestamp

      t.datetime :system_created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :system_updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
