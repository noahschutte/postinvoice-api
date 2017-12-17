# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171217172033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", force: :cascade do |t|
    t.date     "date",                                   null: false
    t.string   "supplier_name",                          null: false
    t.string   "invoice_number",                         null: false
    t.decimal  "total",          precision: 8, scale: 2, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["created_at"], name: "index_invoices_on_created_at", using: :btree
    t.index ["date"], name: "index_invoices_on_date", using: :btree
    t.index ["invoice_number"], name: "index_invoices_on_invoice_number", using: :btree
    t.index ["supplier_name"], name: "index_invoices_on_supplier_name", using: :btree
    t.index ["total"], name: "index_invoices_on_total", using: :btree
    t.index ["updated_at"], name: "index_invoices_on_updated_at", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "invoice_id",                         null: false
    t.string   "code",                               null: false
    t.decimal  "amount",     precision: 8, scale: 2, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["amount"], name: "index_items_on_amount", using: :btree
    t.index ["code"], name: "index_items_on_code", using: :btree
    t.index ["created_at"], name: "index_items_on_created_at", using: :btree
    t.index ["invoice_id"], name: "index_items_on_invoice_id", using: :btree
    t.index ["updated_at"], name: "index_items_on_updated_at", using: :btree
  end

end
