class Vendor < ApplicationRecord

  validates_presence_of :name

  has_many :invoices, class_name: "Invoice", foreign_key: :invoice_id

end
