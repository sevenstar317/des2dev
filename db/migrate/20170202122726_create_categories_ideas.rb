class CreateCategoriesIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_ideas do |t|
      t.references :category, foreign_key: true
      t.references :idea, foreign_key: true
    end
  end
end
