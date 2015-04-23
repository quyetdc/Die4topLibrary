class CreateBooksAuthorsJoin < ActiveRecord::Migration
  def change
    create_table :books_authors_joins do |t|
    	t.column 'book_id', :integer
    	t.column 'author_id', :integer
    end
  end
end
