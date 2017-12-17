a = {
  date: Date.new(2017, 12, 17),
  supplier_name: 'Company A',
  invoice_number: '1111',
  total: 100.00
}

b = {
  date: Date.new(2017, 12, 17),
  supplier_name: 'Company B',
  invoice_number: '2222',
  total: 50.00
}

c = {
  date: Date.new(2017, 12, 17),
  supplier_name: 'Company C',
  invoice_number: '3333',
  total: 50.00
}

d = {
  date: Date.new(2017, 12, 17),
  supplier_name: 'Company D',
  invoice_number: '4444',
  total: 50.00
}

e = {
  date: Date.new(2017, 12, 17),
  supplier_name: 'Company E',
  invoice_number: '5555',
  total: 50.00
}

invoices = [a, b, c, d, e]

invoices.each do |invoice|
  Invoice.create(
    date: invoice[:date],
    supplier_name: invoice[:supplier_name],
    invoice_number: invoice[:invoice_number],
    total: invoice[:total]
  )
end

a1 = {
  invoice_id: Invoice.find(1).id,
  code: 'Wine',
  amount: 50.00
}

a2 = {
  invoice_id: Invoice.find(1).id,
  code: 'Beer',
  amount: 50.00
}

b1 = {
  invoice_id: Invoice.find(2).id,
  code: 'Wine',
  amount: 50.00
}

c1 = {
  invoice_id: Invoice.find(3).id,
  code: 'Wine',
  amount: 50.00
}

d1 = {
  invoice_id: Invoice.find(4).id,
  code: 'Wine',
  amount: 50.00
}

e1 = {
  invoice_id: Invoice.find(5).id,
  code: 'Wine',
  amount: 50.00
}

items = [a1, a2, b1, c1, d1, e1]

items.each do |item|
  Item.create(
    invoice_id: item[:invoice_id],
    code: item[:code],
    amount: item[:amount]
  )
end
