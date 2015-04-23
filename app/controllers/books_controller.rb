class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:title, :sub_title, :authors, :categories, :image, :origin_title, :language, :pulished_year, :pages, :cover_price, :isbn, :description)
    end
end

