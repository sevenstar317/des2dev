class CreateCategoriesProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_projects do |t|
      t.references :category, foreign_key: true
      t.references :project, foreign_key: true
    end
  end
end
