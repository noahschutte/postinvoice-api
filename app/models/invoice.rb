class Invoice < ApplicationRecord

  validates_presence_of :vendor, :date, :number, :total

  has_many :items, class_name: "Item", foreign_key: :invoice_id
  belongs_to :vendor, class_name: "Vendor", foreign_key: :vendor_id

end
