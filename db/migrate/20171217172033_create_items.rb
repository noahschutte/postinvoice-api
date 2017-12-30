class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :invoice, null: false, index: true
      t.references :code, null: false, index: true

      t.decimal :amount, precision: 8, scale: 2, null: false, index: true

      t.timestamps null: false, index: true
    end
  end
end
