class Code < ApplicationRecord

  validates_presence_of :name

  belongs_to :category, class_name: "Category", foreign_key: :category_id
  has_many :items, class_name: "Item", foreign_key: :code_id

end
