class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.string :name, null: false, index: true
      t.references :category, null: false, index: true

      t.date :deleted_at, null: true, index: true
      t.timestamps null: false, index: true
    end
  end
end
