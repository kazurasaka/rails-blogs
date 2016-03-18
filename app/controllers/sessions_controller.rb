class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にrootにリダイレクトする
      redirect_to root_path
    else
      flash.now[:danger] = 'emailかpasswordが間違っています'
      render 'new'
    end
  end

  def destroy
  end
end
