class Band < ApplicationRecord
    has_many :userbands
    has_many :users, through: :userbands
    has_many :posts
    has_many :bandtags
    has_many :tags, through: :bandtags 

    accepts_nested_attributes_for :users 
end
