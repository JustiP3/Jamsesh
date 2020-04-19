module PostsHelper
    def post_by
        "post by " + User.find(@post.author_id).username
    end 

    def back_to_the_band
        "Back to the band - " + @post.band.name
    end 
end
