class CreateSearchSortingOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :search_sorting_options do |t|
      t.references :search, null: false, foreign_key: true
      t.references :sorting_option, null: false, foreign_key: true
      t.timestamps
    end
  end
end
