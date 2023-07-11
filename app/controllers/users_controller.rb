class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, success: "User created successfully"
    else
      flash.now[:error] = "Something went wrong"  # Modificación aquí
      render :new
    end
  end

  def update

    if @user.update(user_params)
      redirect_to user_path(@user.id), success: "User was updated successfully"
    else
      render :edit, error: "Something went wrong"
    end
  end

  def destroy
    if @user.delete
      redirect_to root_path, success: "User was deleted successfully"
    else
      render :show, error: "Something went wrong", status: :unprocessable_entity
  end
 end

    private
  def user_params
    params.require(:user).permit(:fullname, :username, :age, :address, :email, :password_digest, :password_digest_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
   

