class UsersController < ApplicationController
  def index
    # render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      remember @user
      flash[:success] = "ユーザ登録が完了しました"
      redirect_to root_path(@user)
    else
      render 'new'
    end
  end

  def edit
    # render :edit
  end

  def update
    #
  end

  def destroy
    # render :destroy
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
