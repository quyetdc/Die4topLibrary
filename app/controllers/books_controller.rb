class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:title, :sub_title, books_categories_joins: [:id, :book_id, :category_id], books_authors_joins: [:id, :book_id, :author_id], :image, :origin_title, :language, :pulished_year, :pages, :cover_price, :isbn, :description)
    end
end

