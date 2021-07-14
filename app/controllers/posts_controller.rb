class PostsController < ApplicationController

    before_action :set_category, only: [:show_by_category,:create]
    before_action :isreviewable, only: [:create,:update]
    def show_by_category
        if @item
            render json: {Item:@item,posts: @item.posts}
        else
            render json: "No Posts are available"
        end
    end

    def show
        @post=Post.find(params[:id])
        render json: @post
    end

    def index
        @posts = Post.all
        render json: @posts
    end

    def new
        @post = Post.new
    end

    def edit
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = @current_user.id
        @post.commantable=@item
        if @post.save  && @post.commantable_id
            render json: @post, status: :created, location:@post
        else
            render json:{errors: @post.errors,message:"Check the api request properly"}, status: :unprocessable_entity
        end
    end

    def update
        if@post.update(post_params)
            render json:@post
        else
            render json:@post.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @post=Post.find(params[:id])
        if @current_user.id==@post.user_id
            @post.destroy
            render json: "The Post is deleted"
        else
            render json: "Access Denied!! You can't delete the Other User Posts"
        end
    end

    private
    def set_category
        if params[:category_name]=="movies"
            @item=Movie.find_by(id: params[:item_id])
        elsif params[:category_name]=="books"
            @item=Book.find_by(id: params[:item_id])
        else
            @item=Song.find_by(id: params[:item_id])
        end
    end
    def post_params
        params.require(:post).permit(:review)
    end

    def isreviewable
        @item=Category.find_by(name: params[:category_name])
        if @item
            if @item.reviewable==false
                render json: "It is not reviewable"
            end
        else
            render json: "Category not found"
        end
    end
end