class Book < ActiveRecord::Base

	has_many :books_authors_joins
	has_many :authors, :through => :books_authors_joins
	has_many :books_categories_joins
	has_many :categories, :through => :books_categories_joins

	accepts_nested_attributes_for :authors, :allow_destroy => true
	accepts_nested_attributes_for :categories, :allow_destroy => true

	mount_uploader :image, ImageUploader
	
end
