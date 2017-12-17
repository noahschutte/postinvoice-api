class Invoice < ApplicationRecord

  validates_presence_of :date, :supplier_name, :invoice_number, :total

  has_many :items

end
