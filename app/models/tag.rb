class Tag < ApplicationRecord
    has_many :bandtags
    has_many :bands, through: :bandtags 
    
end
