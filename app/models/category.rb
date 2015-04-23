class Category < ActiveRecord::Base
	has_many :books_categories_joins, :dependent => :destroy
	has_many :books, :through => :books_categories_joins

	accepts_nested_attributes_for :books_categories_joins, :allow_destroy => true
end
