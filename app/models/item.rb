class Item < ApplicationRecord

  validates_presence_of :invoice, :code, :amount, :category

  belongs_to :invoice, class_name: "Invoice", foreign_key: :invoice_id
  belongs_to :code, class_name: "Code", foreign_key: :code_id
  belongs_to :category, class_name: "Category", foreign_key: :category_id

end
