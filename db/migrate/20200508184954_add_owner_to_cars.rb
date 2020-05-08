class AddOwnerToCars < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :owner, index: true, null: false, foreign_key: { to_table: :users }
  end
end
