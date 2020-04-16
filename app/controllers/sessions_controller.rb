class SessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]
  
  def new 
    @user = User.new    
    render :login
  end

  def create
    auth_hash = request.env["omniauth.auth"]
    if user = User.find_by_omniauth(auth_hash) || user = User.find_by(session_params)
      if (user && user.authenticate(params[:password])) || (user && auth_hash)
        session[:user_id] = user.id 
        redirect_to user_path(user)      
      else
        @error = "Sorry, the password was incorrect." if user
        render :login 
      end 
      
      redirect_to root_path #if we cant find a user and if oauth does not exist    
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
end
