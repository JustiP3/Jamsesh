class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post 
    accepts_nested_attributes_for :posts
    validates :post_id, presence: true 
end
