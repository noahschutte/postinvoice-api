class Category < ApplicationRecord

  validates_presence_of :name

  has_many :codes, class_name: "Code", foreign_key: :category_id
  has_many :items, class_name: "Item", foreign_key: :category_id

end
