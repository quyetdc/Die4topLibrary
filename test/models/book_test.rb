# == Schema Information
#
# Table name: books
#
#  id            :integer          not null, primary key
#  title         :string
#  sub_title     :string
#  image         :string
#  origin_title  :string
#  language      :string
#  pulished_year :integer
#  pages         :integer
#  cover_price   :float
#  isbn          :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
