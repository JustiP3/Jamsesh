class Band < ApplicationRecord
    has_many :userbands
    has_many :users, through: :userbands
    has_many :posts
    has_many :bandtags
    has_many :tags, through: :bandtags 

    validates :name, uniqueness: true 
    validates :name, presence: true 

    accepts_nested_attributes_for :users, :tags

    def latest_posts
        Post.where(band_id: self.id).limit(2).order("id DESC")
    end 
end
