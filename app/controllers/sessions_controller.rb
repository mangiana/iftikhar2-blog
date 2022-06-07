class SessionsController < ApplicationController
   before_action :check_login, only:[:new, :create]
  
  
  
  def new
  end

  def create
    # byebug
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:notice] = "logged in Successfully"
      redirect_to user
    else
      flash.now[:alert] = "Incorrect Email or Password"
      render "new"
    end
        
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged Out"
    redirect_to root_path
  end

  private
    
    def check_login
      if logged_in?
        flash[:alert] = "You cannot login again, Must logout First"
        redirect_to root_path
      end
    end
end