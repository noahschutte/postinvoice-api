class InventorySheet < ApplicationRecord

  validates_presence_of :date, :beer_total, :wine_total, :food_total
  validates_uniqueness_of :date

  has_many :reports, class_name: "Report", foreign_key: :start_inventory_sheet_id
  has_many :reports, class_name: "Report", foreign_key: :end_inventory_sheet_id

end
