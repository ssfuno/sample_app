class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :photo
      t.string :title
      t.text :matreial
      t.text :process
      t.integer :cooking_minute

      t.timestamps
    end
  end
end
