class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :sub_title
      t.string :image
      t.string :origin_title
      t.string :language
      t.integer :pulished_year
      t.integer :pages
      t.float :cover_price
      t.string :isbn
      t.text :description

      t.timestamps null: false
    end
  end
end
