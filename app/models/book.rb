class Book < ActiveRecord::Base

	has_many :books_authors_joins
	has_many :authors, :through => :books_authors_joins
	has_many :books_categories_joins
	has_many :categories, :through => :books_categories_joins

	accepts_nested_attributes_for :authors, :allow_destroy => true
	accepts_nested_attributes_for :categories, :allow_destroy => true

	mount_uploader :image, ImageUploader

	before_destroy :remove_join_tables

	def remove_join_tables 
		self.authors.clear
		self.categories.clear
	end
	
end
