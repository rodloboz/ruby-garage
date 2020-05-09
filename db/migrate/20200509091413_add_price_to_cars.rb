class AddPriceToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :price_per_day, :integer
  end
end
