class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @states = State.pluck(:name).sort()
    # @cities = City.pluck(:name)
  end

  def create
    @user = User.create(user_params)
    if @user.save
      render plain:'saved'
    else
      render :show,status: :unprocessable_entity
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
  def user_params
    params.require(:users).permit(:username, :email, :gender, :state, :city, hobbies: [])
  end
end
