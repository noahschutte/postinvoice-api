class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.string :name, null: false, index: true

      t.date :deleted_at, null: true, index: true
      t.timestamps null: false, index: true
    end
  end
end
