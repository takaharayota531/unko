class BooksController < ApplicationController
  def new
    @book=Book.new
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="successfully created"
      redirect_to books_path
    else
      flash[:alert]="miss"
      render :index

  end
end
def update
  @book=Book.find(params[:id])
  if @book.update(book_params)
     flash[:notice]="successfully updated!!!!!"
     redirect_to book_path(@book)
      else
      flash[:alert]="miss"
      render :edit
    end
end
def index

  @user=current_user
  @book=Book.new
  @books=Book.all
end
def edit
  @book=Book.find(params[:id])
end
def show
  @user=current_user

  @book=Book.find(params[:id])
  @bbook=Book.new
end
def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
end

private
def book_params
  params.require(:book).permit(:title,:body)
end

end
