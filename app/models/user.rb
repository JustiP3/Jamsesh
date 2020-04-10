class User < ApplicationRecord
    has_many :userbands
    has_many :bands, through: :userbands
    has_many :likes 
    has_many :posts, through: :likes 

    has_secure_password 

    validates :username, uniqueness: true
    
end
