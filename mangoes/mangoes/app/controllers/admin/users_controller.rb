class Admin::UsersController < ApplicationController

  def index
    if current_user.admin?
      @users = User.all
    else
      flash[:notice] = 'Must be admin to access this page!'
      redirect_to movies_path
    end
  end 

  def show 
    @user = User.find(params[:id].to_i)
  end 

end
