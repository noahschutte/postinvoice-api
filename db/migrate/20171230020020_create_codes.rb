class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.string :name, null: false, index: true

      t.timestamps null: false, index: true
    end
  end
end
