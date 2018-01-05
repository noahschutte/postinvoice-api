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

ActiveRecord::Schema.define(version: 20180104215716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.date     "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_categories_on_created_at", using: :btree
    t.index ["deleted_at"], name: "index_categories_on_deleted_at", using: :btree
    t.index ["name"], name: "index_categories_on_name", using: :btree
    t.index ["updated_at"], name: "index_categories_on_updated_at", using: :btree
  end

  create_table "codes", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "category_id", null: false
    t.date     "deleted_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_codes_on_category_id", using: :btree
    t.index ["created_at"], name: "index_codes_on_created_at", using: :btree
    t.index ["deleted_at"], name: "index_codes_on_deleted_at", using: :btree
    t.index ["name"], name: "index_codes_on_name", using: :btree
    t.index ["updated_at"], name: "index_codes_on_updated_at", using: :btree
  end

  create_table "inventory_sheets", force: :cascade do |t|
    t.date     "date",                               null: false
    t.decimal  "beer_total", precision: 8, scale: 2, null: false
    t.decimal  "wine_total", precision: 8, scale: 2, null: false
    t.decimal  "food_total", precision: 8, scale: 2, null: false
    t.date     "deleted_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["beer_total"], name: "index_inventory_sheets_on_beer_total", using: :btree
    t.index ["created_at"], name: "index_inventory_sheets_on_created_at", using: :btree
    t.index ["date"], name: "index_inventory_sheets_on_date", using: :btree
    t.index ["deleted_at"], name: "index_inventory_sheets_on_deleted_at", using: :btree
    t.index ["food_total"], name: "index_inventory_sheets_on_food_total", using: :btree
    t.index ["updated_at"], name: "index_inventory_sheets_on_updated_at", using: :btree
    t.index ["wine_total"], name: "index_inventory_sheets_on_wine_total", using: :btree
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "vendor_id",                          null: false
    t.date     "date",                               null: false
    t.string   "number",                             null: false
    t.decimal  "total",      precision: 8, scale: 2, null: false
    t.date     "deleted_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["created_at"], name: "index_invoices_on_created_at", using: :btree
    t.index ["date"], name: "index_invoices_on_date", using: :btree
    t.index ["deleted_at"], name: "index_invoices_on_deleted_at", using: :btree
    t.index ["number"], name: "index_invoices_on_number", using: :btree
    t.index ["total"], name: "index_invoices_on_total", using: :btree
    t.index ["updated_at"], name: "index_invoices_on_updated_at", using: :btree
    t.index ["vendor_id"], name: "index_invoices_on_vendor_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "invoice_id",                          null: false
    t.integer  "code_id",                             null: false
    t.integer  "category_id",                         null: false
    t.decimal  "amount",      precision: 8, scale: 2, null: false
    t.date     "deleted_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["amount"], name: "index_items_on_amount", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["code_id"], name: "index_items_on_code_id", using: :btree
    t.index ["created_at"], name: "index_items_on_created_at", using: :btree
    t.index ["deleted_at"], name: "index_items_on_deleted_at", using: :btree
    t.index ["invoice_id"], name: "index_items_on_invoice_id", using: :btree
    t.index ["updated_at"], name: "index_items_on_updated_at", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "start_inventory_sheet_id",                         null: false
    t.integer  "end_inventory_sheet_id",                           null: false
    t.date     "start_date_range",                                 null: false
    t.date     "end_date_range",                                   null: false
    t.decimal  "beer_sales_total",         precision: 8, scale: 2, null: false
    t.decimal  "wine_sales_total",         precision: 8, scale: 2, null: false
    t.decimal  "food_sales_total",         precision: 8, scale: 2, null: false
    t.date     "deleted_at"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["beer_sales_total"], name: "index_reports_on_beer_sales_total", using: :btree
    t.index ["created_at"], name: "index_reports_on_created_at", using: :btree
    t.index ["deleted_at"], name: "index_reports_on_deleted_at", using: :btree
    t.index ["end_date_range"], name: "index_reports_on_end_date_range", using: :btree
    t.index ["end_inventory_sheet_id"], name: "index_reports_on_end_inventory_sheet_id", using: :btree
    t.index ["food_sales_total"], name: "index_reports_on_food_sales_total", using: :btree
    t.index ["start_date_range"], name: "index_reports_on_start_date_range", using: :btree
    t.index ["start_inventory_sheet_id"], name: "index_reports_on_start_inventory_sheet_id", using: :btree
    t.index ["updated_at"], name: "index_reports_on_updated_at", using: :btree
    t.index ["wine_sales_total"], name: "index_reports_on_wine_sales_total", using: :btree
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name",       null: false
    t.date     "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_vendors_on_created_at", using: :btree
    t.index ["deleted_at"], name: "index_vendors_on_deleted_at", using: :btree
    t.index ["name"], name: "index_vendors_on_name", using: :btree
    t.index ["updated_at"], name: "index_vendors_on_updated_at", using: :btree
  end

end
