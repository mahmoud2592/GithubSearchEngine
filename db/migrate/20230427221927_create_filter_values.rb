class CreateFilterValues < ActiveRecord::Migration[7.0]
  def change
    create_table :filter_values do |t|
      t.references :filter, null: false, foreign_key: true
      t.string :value

      t.datetime :system_created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :system_updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
