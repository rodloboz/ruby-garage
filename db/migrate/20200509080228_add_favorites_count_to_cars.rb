class AddFavoritesCountToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :favorited_count, :integer, null: false, default: 0
  end
end
