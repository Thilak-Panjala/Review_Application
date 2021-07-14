class CommentsController < ApplicationController

    before_action :set_comment, only: [:show, :edit, :update, :destroy]

    def show_by_posts
        @comments=Comment.where(post_id: params[:post_id])
        render json: @comments
    end
    
    def show
        render json: @comment
    end


    def index
        @comments = Comment.all
        render json: {comments:@comments}
    end
    def new
        @comment = Comment.new
    end
    
    def edit
    end

    def create
            @comment = Comment.create(statement: params[:statement])
            @comment.post_id=params[:post_id]
            @comment.user_id=@current_user.id
            if@comment.save && @comment.user_id && @comment.post_id
                render json:@comment, status: :created, location:@comment
            else
                render json:@comment.errors, status: :unprocessable_entity
            end
    end

    def update
        if @current_user.id==@comment.user_id
            if@comment.update(comment_params)
                render json:@comment
            else
                render json:@comment.errors, status: :unprocessable_entity
            end
        else
            render json: "you can't update others comments"
        end
    end

    def destroy
        @post = Post.find_by(id: params[:post_id])
        if @current_user.id==@comment.user_id || @current_user.id==@post.user_id || @current_user.admin?
            @comment.destroy
            render json: "The comment is deleted"
        else
            render json: "Access Denied!! You can't Delete Others Comments"
        end
    end

    private
    def set_comment
        @comment = Comment.find(params[:id])
    end
end