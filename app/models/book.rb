class Book < ActiveRecord::Base
	has_many :books_authors_joins, :dependent => :destroy
	has_many :authors, :through => :books_authors_joins
	has_many :books_categories_joins, :dependent => :destroy
	has_many :categories, :through => :books_categories_joins

	accepts_nested_attributes_for :books_authors_joins, :allow_destroy => true
	accepts_nested_attributes_for :books_categories_joins, :allow_destroy => true
	
end
