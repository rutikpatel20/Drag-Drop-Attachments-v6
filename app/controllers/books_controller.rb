class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.valid?
      flash[:errors] = "Book Created Successfully"
      redirect_to book_path(@book)
    else
      flash[:errors] = @book.errors.full_messages
      redirect_to new_book_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:errors] = "Book Updated Successfully"
      redirect_to book_path(@book)
    else
      flash[:errors] = @book.errors.full_messages
      redirect_to edit_book_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.delete
      flash[:errors] = "Book Deleted Successfully"
      redirect_to root_path(@book)
    else
      flash[:errors] = @book.errors.full_messages
      redirect_to destroy_book_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :price, :cover_page, files: [])
  end
end
