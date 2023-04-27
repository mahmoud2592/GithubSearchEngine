class CreateSortingOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :sorting_options do |t|
      t.string :name
      t.string :direction
      t.string :field
      t.integer :github_sorting_option_id

      t.datetime :system_created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :system_updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
