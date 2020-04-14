class CommentsController < ApplicationController
    before_action :find_post
    def new 
        @comment = Comment.new
    end 
    def create        
        @comment = Comment.new(comment_params)
        if @comment.save 
            redirect_to post_comments_path(@post, @comment)
        else 
            flash[:message] = "A comment cannot be blank"
            redirect_to new_post_comment_path(@post, @comment)
        end 
    end 
    def index 
    end 
    
    def destroy 
    end 

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end 

    def find_post
        @post = Post.find_by(id: params[:post_id])
    end 
end
