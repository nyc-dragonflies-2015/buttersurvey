class UsersController < ActionController::Base

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account successfully created"
      redirect_to root_path
    else
      flash[:notice] = "User already exists"
      redirect_to login_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end


  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Account has been deleted"
    redirect_to root_path
  end

end