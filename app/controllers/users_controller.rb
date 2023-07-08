class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
        redirect_to root_path, success: "User created successfully"
    else
        render :new, error: "Something went wrong"
    end
  end

    private
  def user_params
    params.require(:user).permit(:fullname, :username, :age, :address, :email, :password_digest)
  end
end
 