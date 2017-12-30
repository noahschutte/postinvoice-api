class Category < ApplicationRecord

  validates_presence_of :name

  has_many :codes, class_name: "Code", foreign_key: :category_id

end
