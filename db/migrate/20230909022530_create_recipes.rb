class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      
      t.string :name, null: false
      t.text :explanation, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
