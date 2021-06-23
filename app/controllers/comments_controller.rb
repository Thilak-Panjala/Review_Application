class CommentsController < ApplicationController

    before_action :set_comment, only: [:show, :edit, :update, :destroy]

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
            @comment = Comment.create(params[:statement])
            if@comment.save
                render json:@comment, status: :created, location:@comment
            else
                render json:@comment.errors, status: :unprocessable_entity
            end
    end

    def update
        if@comment.update(comment_params)
            render json:@comment
        else
            render json:@comment.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find_by(id: params[:post_id])
        if @current_user.id==params[:id] || @current_user.id==@post.user_id
            @comment.destroy
            render json: "The comment is deleted"
        else
            render json: "Access Denied!! You can't Delete Books"
        end
    end

    private

    def set_comment
        @comment = Comment.find(params[:id])
    end
end