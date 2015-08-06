# == Schema Information
#
# Table name: books_categories_joins
#
#  id          :integer          not null, primary key
#  book_id     :integer
#  category_id :integer
#

class BooksCategoriesJoin < ActiveRecord::Base
	belongs_to :book
	belongs_to :category
end
