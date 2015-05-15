class HomeController < ApplicationController
  def index
  	@books = Book.all
  	@categories = Category.all
  	@authors = Author.all
  end
end
