class UsersController < ApplicationController

  before_action :load_user, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'User successfully created!'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have successfully updated your profile.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  

  def show
    @questions = @user.questions.order(created_at: :desc)
    @new_question = @user.questions.build
    
  end

  private
  def load_user
    @user ||= User.find params[:id]
  end
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :username, :avatar_url, :bio)
  end
end
