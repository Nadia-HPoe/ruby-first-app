class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'You have successfully logged in!'
    else
      flash.now.alert = 'Incorrect email or password!'  
      render :new
    end
  end

  def destroy
  end
end
