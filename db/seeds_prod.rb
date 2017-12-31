category1 = {
  name: 'Beer'
}

category2 = {
  name: 'Wine'
}

category3 = {
  name: 'Food'
}

category4 = {
  name: 'Other'
}

categories = [
  category1,
  category2,
  category3,
  category4
]

categories.each do |category|
  Category.create!(
    name: category[:name]
  )
end

code1 = {
  name: 'Beer',
  category_id: Category.find_by(id: 1).id
}

code2 = {
  name: 'Wine',
  category_id: Category.find_by(id: 2).id
}

code3 = {
  name: 'Meat',
  category_id: Category.find_by(id: 3).id
}

code4 = {
  name: 'Dairy',
  category_id: Category.find_by(id: 3).id
}

code5 = {
  name: 'Seafood',
  category_id: Category.find_by(id: 3).id
}

code6 = {
  name: 'Dry Goods',
  category_id: Category.find_by(id: 3).id
}

code7 = {
  name: 'Produce',
  category_id: Category.find_by(id: 3).id
}

code8 = {
  name: 'NA Beverage',
  category_id: Category.find_by(id: 3).id
}

code9 = {
  name: 'Linens',
  category_id: Category.find_by(id: 4).id
}

code10 = {
  name: 'Cleaning Services',
  category_id: Category.find_by(id: 4).id
}

code11 = {
  name: 'Maintenance',
  category_id: Category.find_by(id: 4).id
}

code12 = {
  name: 'Chemicals',
  category_id: Category.find_by(id: 4).id
}

code13 = {
  name: 'Operating Supplies',
  category_id: Category.find_by(id: 4).id
}

code14 = {
  name: 'To-Go Products',
  category_id: Category.find_by(id: 4).id
}

code15 = {
  name: 'Menu Printing',
  category_id: Category.find_by(id: 4).id
}

code16 = {
  name: 'Landscaping',
  category_id: Category.find_by(id: 4).id
}

code17 = {
  name: 'Glassware',
  category_id: Category.find_by(id: 4).id
}

code18 = {
  name: 'China & Silverware',
  category_id: Category.find_by(id: 4).id
}

code19 = {
  name: 'Décor Supplies',
  category_id: Category.find_by(id: 4).id
}

code20 = {
  name: 'Equipment Rental',
  category_id: Category.find_by(id: 4).id
}

code21 = {
  name: 'Employee Gifts',
  category_id: Category.find_by(id: 4).id
}

code22 = {
  name: 'Marketing',
  category_id: Category.find_by(id: 4).id
}

code23 = {
  name: 'Gas & Electric',
  category_id: Category.find_by(id: 4).id
}

code24 = {
  name: 'Telephone & Cable',
  category_id: Category.find_by(id: 4).id
}

code25 = {
  name: 'Security & Alarm',
  category_id: Category.find_by(id: 4).id
}

code26 = {
  name: 'Dues & Subscriptions',
  category_id: Category.find_by(id: 4).id
}

code27 = {
  name: 'Pest Control',
  category_id: Category.find_by(id: 4).id
}

code28 = {
  name: 'Office Supplies',
  category_id: Category.find_by(id: 4).id
}

code29 = {
  name: 'Smallwares',
  category_id: Category.find_by(id: 4).id
}

code30 = {
  name: 'Repairs',
  category_id: Category.find_by(id: 4).id
}

code31 = {
  name: 'Catering Supplies',
  category_id: Category.find_by(id: 4).id
}

code32 = {
  name: 'Shipping & Postage',
  category_id: Category.find_by(id: 4).id
}

code32 = {
  name: 'Keg Deposit/Credit',
  category_id: Category.find_by(id: 4).id
}


codes = [
  code1,
  code2,
  code3,
  code4,
  code5,
  code6,
  code7,
  code8,
  code9,
  code10,
  code11,
  code12,
  code13,
  code14,
  code15,
  code16,
  code17,
  code18,
  code19,
  code20,
  code21,
  code22,
  code23,
  code24,
  code25,
  code26,
  code27,
  code28,
  code29,
  code30,
  code31,
  code32,
  code33
]

codes.each do |code|
  Code.create(
    name: code[:name],
    category_id: code[:category_id]
  )
end
