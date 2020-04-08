class Post < ApplicationRecord
    belongs_to :band
    has_many :likes
    has_many :users, through: :likes 
end
