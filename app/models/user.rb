class User < ApplicationRecord
    has_many :userbands
    has_many :bands, through: :userbands

    has_many :comments
    has_many :posts, through: :comments 

    has_secure_password 

    validates :username, uniqueness: true
    validates :username, presence: true 

    def self.find_by_omniauth 
        #login via omniauth-github
      oauth_email = request.env['omniauth.auth']["info"]['email']
      if user = User.find_by(email: oauth_email) #existing user oauth
        session[:user_id] = user.id 
        redirect_to user_path(user)
      elsif oauth_email #new user oauth
        redirect_to new_user_path 
      end 
    end 
    
end
