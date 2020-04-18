class User < ApplicationRecord
    has_many :userbands
    has_many :bands, through: :userbands

    has_many :comments
    has_many :posts, through: :comments 

    has_secure_password 

    validates :username, uniqueness: true
    validates :username, presence: true 

    def self.find_by_omniauth(auth_hash)
      oauth_email = auth_hash['info']['email']
      user = User.find_by(email: oauth_email)  
    end 
    
end
