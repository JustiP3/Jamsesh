class SessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]
  
  def new 
    @user = User.new    
    render :login
  end

  def create
    user = user_by_omni
    user ||= user_by_params

    if (user && user.authenticate(params[:password])) || (user && request.env)
      session[:user_id] = user.id 
      redirect_to user_path(user)          
    elsif user       
      @error = "Sorry, the password was incorrect."
      render :login 
    elsif request.env 
      flash["message"] = "You must create an account before you can log in with github."
      redirect_to new_user_path
    else 
      redirect_to root_path 
    end 
      
     
    
  end 

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def session_params
    params.require(:sessions).permit(:username)
  end 

  def user_by_omni
    if request.env["omniauth.auth"]
      user = User.find_by_omniauth(request.env["omniauth.auth"])
    end 
  end 

  def user_by_params
   user = User.find_by(session_params)
  end 
end
