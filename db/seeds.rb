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
#
code1 = {
  name: 'Beer'
}

code2 = {
  name: 'Wine'
}

codes = [
  code1,
  code2
]

codes.each do |code|
  Code.create(
    name: code[:name]
  )
end

a1 = {
  invoice_id: Invoice.find(1).id,
  code_id: Code.find(2).id,
  amount: 11
}

a2 = {
  invoice_id: Invoice.find(1).id,
  code_id: Code.find(1).id,
  amount: 22.22
}

b1 = {
  invoice_id: Invoice.find(2).id,
  code_id: Code.find(2).id,
  amount: 33.3
}

c1 = {
  invoice_id: Invoice.find(3).id,
  code_id: Code.find(2).id,
  amount: 44.44
}

d1 = {
  invoice_id: Invoice.find(4).id,
  code_id: Code.find(2).id,
  amount: 55.555
}

e1 = {
  invoice_id: Invoice.find(5).id,
  code_id: Code.find(2).id,
  amount: 66
}

items = [a1, a2, b1, c1, d1, e1]

items.each do |item|
  Item.create(
    invoice_id: item[:invoice_id],
    code_id: item[:code_id],
    amount: item[:amount]
  )
end
