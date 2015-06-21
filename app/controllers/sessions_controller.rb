class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if User.find_by(name: user_params[:name]) == nil
      flash[:notice] = "Invalid Username or Password"
      redirect_to login_path
    else
    user = User.find_by(name: user_params[:name])
     user.password == params[:password]
      session[:user_id] = user.id
      @current_user = User.find(user.id)
      redirect_to root_path
    end
  end

  def current_user
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end