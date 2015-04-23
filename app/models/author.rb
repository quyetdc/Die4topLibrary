class Author < ActiveRecord::Base
	has_many :books_authors_joins, :dependent => :destroy
	has_many :books, :through => :books_authors_joins
end
