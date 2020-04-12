class Post < ApplicationRecord
    belongs_to :band
    accepts_nested_attributes_for :band

    validates :title, presence: true 
    validates :content, presence: true 
end
