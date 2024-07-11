class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @states = State.pluck(:name).sort()
    @state = State.select(:name).where(name: params[:state])
    @cities = City.joins(:State).where(@state).pluck(:name)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new,status: :unprocessable_entity
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :gender, :state, :city, hobbies: [])
  end
end
