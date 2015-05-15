class CreateBooksCategoriesJoin < ActiveRecord::Migration
  def change
    create_table :books_categories_joins do |t|
    	t.column 'book_id', :integer
    	t.column 'category_id', :integer
    end
  end
end
