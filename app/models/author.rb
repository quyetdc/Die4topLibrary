class Author < ActiveRecord::Base
	has_many :books_authors_joins, :dependent => :destroy
	has_many :books, :through => :books_authors_joins

	accepts_nested_attributes_for :books_authors_joins, :allow_destroy => true
end
