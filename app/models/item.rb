class Item < ApplicationRecord

  validates_presence_of :invoice, :code, :amount

  belongs_to :invoice

end
