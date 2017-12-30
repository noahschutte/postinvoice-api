class Code < ApplicationRecord

  validates_presence_of :name

  has_many :items, class_name: "Item", foreign_key: :code_id

end
