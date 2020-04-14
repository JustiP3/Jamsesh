class Post < ApplicationRecord
    belongs_to :band
    has_many :comments 
    has_many :users, through: :comments 
    accepts_nested_attributes_for :band
    accepts_nested_attributes_for :comments 

    validates :title, presence: true 
    validates :content, presence: true 

    def error_string 
        if self.errors.any?
            message = ""
            if self.errors.full_messages.size > 1 
                message = self.errors.full_messages[0] + " and " + self.errors.full_messages[1]
            else 
                message = self.errors.full_messages[0]
            end
        end 
        message
    end 
end
