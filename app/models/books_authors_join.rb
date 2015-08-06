# == Schema Information
#
# Table name: books_authors_joins
#
#  id        :integer          not null, primary key
#  book_id   :integer
#  author_id :integer
#

class BooksAuthorsJoin < ActiveRecord::Base
	belongs_to :book
	belongs_to :author
end
