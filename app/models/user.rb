class User < ApplicationRecord
    has_many :userbands
    has_many :bands, through: :userbands

    has_many :comments
    has_many :posts, through: :comments 

    has_secure_password 

    validates :username, uniqueness: true
    validates :username, presence: true 
    
end
