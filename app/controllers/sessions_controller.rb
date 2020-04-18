class SessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]
  
  def new 
    @user = User.new    
    render :login
  end

  def create
    o_user = user_by_omni
    p_user = user_by_params

    if (p_user && p_user.authenticate(params[:password])) || o_user   #good login 
      p_user ||= o_user 
      session[:user_id] = p_user.id 
      redirect_to user_path(p_user)          
    elsif p_user       #traditional login attempt but pw not authenticated 
      @error = "Sorry, the password was incorrect."
      render :login 
    elsif request.env["omniauth.auth"] && !request.env["omniauth.auth"]["info"]["email"]  #omni login but email nil
      @error = "Please set your github email to publically viewable in your github account settings."
      render :login
    elsif request.env["omniauth.auth"]["info"]["email"] #omni login attempt doesn't match any existing users
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
