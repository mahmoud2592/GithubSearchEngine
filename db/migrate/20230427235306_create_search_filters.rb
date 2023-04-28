class CreateSearchFilters < ActiveRecord::Migration[7.0]
  def change
    create_table :search_filters do |t|
      t.references :search, null: false, foreign_key: true
      t.references :filter, null: false, foreign_key: true
      t.references :filter_value, null: false, foreign_key: true
      t.timestamps
    end
  end
end
