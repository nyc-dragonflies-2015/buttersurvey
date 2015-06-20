class UsersController < ActionController::Base

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_user_path
    else
      redirect_to new_user_path
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def user_submissions
    @user = User.find(params[:user_id])
  end

  def user_comments
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.new()
  end


  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

end