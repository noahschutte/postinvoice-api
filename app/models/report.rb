class Report < ApplicationRecord

  validates_presence_of :start_inventory_sheet, :end_inventory_sheet, :start_date_range, :end_date_range, :beer_sales_total, :wine_sales_total, :food_sales_total

  belongs_to :start_inventory_sheet, class_name: "InventorySheet", foreign_key: :start_inventory_sheet_id
  belongs_to :end_inventory_sheet, class_name: "InventorySheet", foreign_key: :end_inventory_sheet_id

end
