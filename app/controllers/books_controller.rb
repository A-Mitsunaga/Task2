class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully saved."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render action: :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
   book = Book.find(params[:id])

   if book.update(book_params)
     flash[:notice] = "Book was successfully updated."
     redirect_to book_path(book.id)
   else
     flash[:notice] = "error"
     render action: :edit
   end
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_path
    if book.destroy
    flash[:notice] = "Book was successfully destroyed."
    end
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
