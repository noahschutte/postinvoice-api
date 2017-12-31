class InventorySheet < ApplicationRecord

  validates_presence_of :date, :beer_total, :wine_total, :food_total
  validates_uniqueness_of :date

end
