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

code33 = {
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



vendorA = {
  name: 'Company A'
}

vendorB = {
  name: 'Company B'
}

vendorC = {
  name: 'Company C'
}

vendorD = {
  name: 'Company D'
}

vendorE = {
  name: 'Company E'
}

vendors = [
  vendorA,
  vendorB,
  vendorC,
  vendorD,
  vendorE
]

vendors.each do |vendor|
  Vendor.create(
    name: vendor[:name]
  )
end

a = {
  date: Date.new(2017, 12, 17),
  vendor_id: Vendor.find(1).id,
  number: '1111',
  total: 33.22
}

b = {
  date: Date.new(2017, 12, 18),
  vendor_id: Vendor.find(2).id,
  number: '2222',
  total: 33.3
}

c = {
  date: Date.new(2017, 12, 19),
  vendor_id: Vendor.find(3).id,
  number: '3333',
  total: 44.44
}

d = {
  date: Date.new(2017, 12, 20),
  vendor_id: Vendor.find(4).id,
  number: '4444',
  total: 55.555
}

e = {
  date: Date.new(2017, 12, 21),
  vendor_id: Vendor.find(5).id,
  number: '5555',
  total: 66
}

invoices = [a, b, c, d, e]

invoices.each do |invoice|
  Invoice.create(
    date: invoice[:date],
    vendor_id: invoice[:vendor_id],
    number: invoice[:number],
    total: invoice[:total]
  )
end

a1 = {
  invoice_id: Invoice.find(1).id,
  code_id: Code.find(1).id,
  category_id: Code.find(1).category_id,
  amount: 11
}

a2 = {
  invoice_id: Invoice.find(1).id,
  code_id: Code.find(2).id,
  category_id: Code.find(2).category_id,
  amount: 22.22
}

b1 = {
  invoice_id: Invoice.find(2).id,
  code_id: Code.find(2).id,
  category_id: Code.find(2).category_id,
  amount: 33.3
}

c1 = {
  invoice_id: Invoice.find(3).id,
  code_id: Code.find(2).id,
  category_id: Code.find(2).category_id,
  amount: 44.44
}

d1 = {
  invoice_id: Invoice.find(4).id,
  code_id: Code.find(2).id,
  category_id: Code.find(2).category_id,
  amount: 55.555
}

e1 = {
  invoice_id: Invoice.find(5).id,
  code_id: Code.find(2).id,
  category_id: Code.find(2).category_id,
  amount: 66
}

items = [a1, a2, b1, c1, d1, e1]

items.each do |item|
  Item.create(
    invoice_id: item[:invoice_id],
    code_id: item[:code_id],
    amount: item[:amount],
    category_id: item[:category_id]
  )
end

inventory_sheet1 = {
  date: Date.new(2017, 12, 17),
  beer_total: 9,
  wine_total: 8.8,
  food_total: 7.77
}

inventory_sheet2 = {
  date: Date.new(2017, 12, 24),
  beer_total: 4.444,
  wine_total: 5.555,
  food_total: 6.666
}

inventory_sheets = [
  inventory_sheet1,
  inventory_sheet2
]

inventory_sheets.each do |inventory_sheet|
  InventorySheet.create!(
    date: inventory_sheet[:date],
    beer_total: inventory_sheet[:beer_total],
    wine_total: inventory_sheet[:wine_total],
    food_total: inventory_sheet[:food_total]
  )
end

report1 = {
  start_inventory_sheet: InventorySheet.find(1),
  end_inventory_sheet: InventorySheet.find(2),
  start_date_range: '2017-12-17',
  end_date_range: '2017-12-24',
  beer_sales_total: 123.45,
  wine_sales_total: 2345.6,
  food_sales_total: 34567
}

reports = [
  report1
]

reports.each do |report|
  Report.create!(
    start_inventory_sheet: report[:start_inventory_sheet],
    end_inventory_sheet: report[:end_inventory_sheet],
    start_date_range: report[:start_date_range],
    end_date_range: report[:end_date_range],
    beer_sales_total: report[:beer_sales_total],
    wine_sales_total: report[:wine_sales_total],
    food_sales_total: report[:food_sales_total],
  )
end
