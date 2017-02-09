class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.boolean :active
      t.string :kind
      t.string :name
      t.integer :quantity, null: false, default: 1
      t.float :price, null: false, default: 0
      t.float :total, null: false, default: 0
      t.references :priceable, polymorphic: true

      t.timestamps
    end
  end
end
