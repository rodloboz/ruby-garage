class AddBookedCountToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :number_of_bookings, :integer, null: false, default: 0
  end
end
