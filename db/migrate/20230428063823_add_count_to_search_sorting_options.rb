class AddCountToSearchSortingOptions < ActiveRecord::Migration[6.1]
  def change
    add_column :search_sorting_options, :count, :integer, default: 0, null: false
  end
end
