class SessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]
  
  def new 
    @user = User.new    
    render :login
  end

  def create
    @user = User.find_by(username: params[:username]) 
    if user.authenticate(params[:password])
      session[:username] = @user.username 
      redirect_to user_path(@user)
    else
      render :login 
    end 
  end

  def destroy
    session.delete :username
  end

  private

  def session_params
    params.require(:sessions).permit(:username, :password)
  end 
end
