class BooksController < ApplicationController




  def index
    @book = Book.new
    @books  = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @books  = Book.all
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to '/books'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
      if @book.save
        flash[:notice] = "Your book was successfully created."
        redirect_to book_path(@book.id)
      else
         @user = current_user
         @books = Book.all
        render :index
      end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        flash[:notice] = "Your book was successfully updated."
         redirect_to book_path(@book.id)
    else
        render :edit
    end
  end


    private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end


end

