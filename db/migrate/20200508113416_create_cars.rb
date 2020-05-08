class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.references :manufacturer, null: false, foreign_key: true
      t.references :model, null: false, foreign_key: true
      t.string :color
      t.integer :year
      t.string :number_plate
      t.string :description

      t.timestamps
    end
  end
end
