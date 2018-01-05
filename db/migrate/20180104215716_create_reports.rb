class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :start_inventory_sheet, null: false, index: true
      t.references :end_inventory_sheet, null: false, index: true

      t.date :start_date_range, null: false, index: true
      t.date :end_date_range, null: false, index: true

      t.decimal :beer_sales_total, precision: 8, scale: 2, null: false, index: true
      t.decimal :wine_sales_total, precision: 8, scale: 2, null: false, index: true
      t.decimal :food_sales_total, precision: 8, scale: 2, null: false, index: true

      t.date :deleted_at, null: true, index: true
      t.timestamps null: false, index: true
    end
  end
end
