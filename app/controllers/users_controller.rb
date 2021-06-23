class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @book=Book.new
  @books=Book.all
  end
  def edit
    @user=User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="The User is successfully updated!!!!!"

      redirect_to user_path(@user.id)
    else
       flash[:alert]="The User is failed to update"
       redirect_to user_path(@user.id)
  end
  end
  def index
    @user=current_user
    @users=User.all
    @book=Book.new
  end
  private

  def user_params
    params.require(:user).permit(:name,:introduction ,:profile_image)
  end
end
