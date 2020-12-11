class UsersController < ApplicationController
  def index
    @users = User.order('id ASC')
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created"
      redirect_to(users_path)
    else
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User updated"
      redirect_to(user_path(@user))
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to(users_path)
  end

  private
    def user_params
      params.require(:user).permit(
        :firstName,
        :lastName,
        :email,
        :admin,
        :password,
        :password_confirmation
      )
    end
end
