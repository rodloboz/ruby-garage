class AddHexCodeToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :hex_code, :string
  end
end
