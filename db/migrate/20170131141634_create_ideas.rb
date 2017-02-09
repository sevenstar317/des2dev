class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :kind
      t.string :status
      t.references :owner, references: :user
      t.text :description
      t.string :designer_participation
      t.date :deadline
      t.text :references
      t.text :flow
      t.float :subtotal_price
      t.integer :discount
      t.float :total_price
      t.float :grand_total
      t.boolean :private_contest

      t.timestamps
    end
  end
end
