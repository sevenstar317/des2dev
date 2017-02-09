class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :funding
      t.integer :reward
      t.references :owner, references: :user
      t.string :status
      t.text :our_story
      t.text :our_team

      t.timestamps
    end
  end
end
