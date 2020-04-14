class CommentsController < ApplicationController
    before_action :find_post
    def new 
        @comment = Comment.new
    end 
    def create        
        raise params.inspect 
        @comment = Comment.new(comment_params)
        @comment.user = current_user 

        if @comment.save 
            redirect_to post_comments_path(@post, @comment)
        else 
            render :new 
        end 
    end 
    def index 
        redirect_to post_path(@post)
    end 
    
    def destroy 
    end 

    private

    def comment_params
        params.require(:comment).permit(:content, :post_id)
    end 

    def find_post
        @post = Post.find(params[:post_id])
    end 
end
