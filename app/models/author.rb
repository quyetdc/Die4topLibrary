# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  name        :string
#  avatar      :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Author < ActiveRecord::Base


	has_many :books_authors_joins
	has_many :books, :through => :books_authors_joins

	accepts_nested_attributes_for :books, :allow_destroy => true

	
	mount_uploader :avatar, ImageUploader
end
