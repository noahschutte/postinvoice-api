class CreateInventorySheets < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_sheets do |t|
      t.date :date, null: false, index: true
      t.decimal :beer_total, precision: 8, scale: 2, null: false, index: true
      t.decimal :wine_total, precision: 8, scale: 2, null: false, index: true
      t.decimal :food_total, precision: 8, scale: 2, null: false, index: true

      t.date :deleted_at, null: true, index: true
      t.timestamps null: false, index: true
    end
  end
end
