class BooksController < ApplicationController
  def index
    @authors = Author.all
    author_ids = helpers.list_of_numbers(params[:name])
    @pagy, @records = pagy(helpers.search(author_ids, params[:min], params[:max]))
  end

  def show
    @book = Book.includes(:author, :gutenberg, :image_urls, :images, :wikipedics, :book_tags, :similar_books).find(params[:id])
    @tags = @book.book_tags.includes(:tag)
    @another_books = @book.similar_books.includes(:another_book)
    @goodread = @book.wikipedics.find_by(source: "goodreads")
    @wikipedium = @book.wikipedics.find_by(source: "wikipedia")
    @comments = Comment.where(type: "Book").where(reference_id: @book.id).order(id: :desc)
  end

  def edit
    @book = Book.includes(:author, :gutenberg, :image_urls, :images, :wikipedics, :book_tags, :similar_books).find(params[:id])
    @goodread = @book.wikipedics.find_by(source: "goodreads")
    @wikipedium = @book.wikipedics.find_by(source: "wikipedia")
    @tags = @book.book_tags.includes(:tag)
  end
end
