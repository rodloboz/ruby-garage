class AddCountersToManufacturers < ActiveRecord::Migration[6.0]
  def change
    add_column :manufacturers, :car_count, :integer, null: false, default: 0
    add_column :models, :car_count, :integer, null: false, default: 0
  end
end
