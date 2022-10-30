class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
   @user = User.find(params[:id])
  end

  def index
   @user = current_user
   @users = User.all
  end

  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "Your pofile was succssesefully updated."
       redirect_to  user_path(@user.id)
     else
      render :edit
     end
  end

private
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end

def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(users_path) unless @user == current_user
end

end


