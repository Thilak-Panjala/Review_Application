class PostsController < ApplicationController

    def show_by_category
        @posts=Post.where(category_id: Category.find_by(name: params[:category_name]).id).where(item_id: params[:item_id])
                .where(user_id: params[:user_id])
        if params[:category_name]=="movies"
            @item=Movie.find_by(id: params[:item_id])
        else
            @item=Book.find_by(id: params[:item_id])
        end
        
        render json: {Title:@item, posts: @posts.as_json(only: [:id,:review,:user_id])}
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
        @post.user = @current_user
        @post.category = Category.find_by(name: params[:category_name])
        @post.item_id =  params[:item_id]
        if params[:category_name]=="movies"
            @item=Movie.find_by(id: params[:item_id])
        else
            @item=Book.find_by(id: params[:item_id])
        end
        if @post.save && @item && @post.category
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

    def post_params
        params.require(:post).permit(:review)
    end
end