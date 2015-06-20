class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create

    user = User.find_by(name: user_params[:name])
    if user.password == params[:password]
      session[:user_id] = user.id
      @current_user = User.find(user.id)
      redirect_to user_path
    else
      redirect_to user_path
    end
  end

  def current_user
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end