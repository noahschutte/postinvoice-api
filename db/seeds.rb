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
  date: Date.new(2017, 12, 17),
  vendor_id: Vendor.find(2).id,
  number: '2222',
  total: 33.3
}

c = {
  date: Date.new(2017, 12, 17),
  vendor_id: Vendor.find(3).id,
  number: '3333',
  total: 44.44
}

d = {
  date: Date.new(2017, 12, 17),
  vendor_id: Vendor.find(4).id,
  number: '4444',
  total: 55.555
}

e = {
  date: Date.new(2017, 12, 17),
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

codes = [
  code1,
  code2
]

codes.each do |code|
  Code.create(
    name: code[:name],
    category_id: code[:category_id]
  )
end

a1 = {
  invoice_id: Invoice.find(1).id,
  code_id: Code.find(2).id,
  category_id: Code.find(2).category_id,
  amount: 11
}

a2 = {
  invoice_id: Invoice.find(1).id,
  code_id: Code.find(1).id,
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
  beer_total: 1,
  wine_total: 2.2,
  food_total: 3.33
}

inventory_sheets = [
  inventory_sheet1
]

inventory_sheets.each do |inventory_sheet|
  InventorySheet.create!(
    date: inventory_sheet[:date],
    beer_total: inventory_sheet[:beer_total],
    wine_total: inventory_sheet[:wine_total],
    food_total: inventory_sheet[:food_total]
  )
end
