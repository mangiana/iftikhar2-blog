class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 4)
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 4)
  end
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
        flash[:notice] = "Welcome To Iftikhar Blog! #{@user.username} You have Successfully Signed Up"
        redirect_to articles_path
    else
        render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your Account Successfully Updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end