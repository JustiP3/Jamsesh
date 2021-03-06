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
    else           
      find_error(o_user, p_user, request.env["omniauth.auth"])
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
    User.find_by_omniauth(request.env["omniauth.auth"]) if request.env["omniauth.auth"]
  end 

  def user_by_params
    User.find_by(session_params) if params[:sessions]
  end 

  def find_error (o_user, p_user, omni_hash)
    if  p_user      #traditional login attempt but pw not authenticated 
      @error = "Sorry, the password was incorrect."
      render :login   
    
    elsif request.env["omniauth.auth"] #omni login 
      
      if !request.env["omniauth.auth"]["info"]["email"]  #omni login but email nil
        @error = "Please set your Github email to public in your Github account settings."
        render :login
      elsif request.env["omniauth.auth"]["info"]["email"] #omni login attempt doesn't match any existing users
        flash[:message] = "You must create an account before you can log in with Github."
        redirect_to new_user_path
      end 

    elsif !p_user && !o_user   # if not any above errors, user tried to log in traditionally but user wasn't found 
      @error = "Sorry, we could not find that user."  
      render :login 
    else   # catch all to not crash my app. should never execute 
      redirect_to root_path 
    end   
  end    

end
