class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.date :date, null: false, index: true
      t.string :supplier_name, null: false, index: true
      t.string :invoice_number, null: false, index: true
      t.decimal :total, precision: 8, scale: 2, null: false, index: true

      t.timestamps null: false, index: true
    end
  end
end
