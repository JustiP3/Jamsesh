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

    def set_band_attributes(band_params, tag_params, user, current_user)
        unless tag_params[:name] == ""
            self.tags << Tag.find_or_create_by(name: tag_params[:name]) 
        end  
        self.location = band_params[:location] 
        self.name =   band_params[:name]  
        self.users << current_user 
        self.users << user if user
    end 
    def update_band_attributes(band_params, user)
        if user 
            self.users << user unless self.users.find {|band_member| band_member.username == user.username}
        end 
        self.location = band_params[:location] 
    end 
end
