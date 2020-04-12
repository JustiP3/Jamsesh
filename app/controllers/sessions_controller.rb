class SessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]
  
  def new 
    @user = User.new    
    render :login
  end

  def create
    @user = User.find_by(username: params[:user_id]) 
    if user.authenticate(params[:password])
      session[:user_id] = @user.username 
      redirect_to user_path(@user)
    else
      render :login 
    end 
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def session_params
    params.require(:sessions).permit(:username, :password)
  end 
end
