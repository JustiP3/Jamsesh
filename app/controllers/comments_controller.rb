class CommentsController < ApplicationController
    before_action :find_post, only: [:new, :destroy]
    def new 
        @comment = @post.comments.build 
    end 
    def create       
        @comment = Comment.new(comment_params)
        @comment.user = current_user 

        if @comment.save 
            redirect_to post_path(@comment.post)
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
