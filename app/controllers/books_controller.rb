class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def show
        render json: @book
    end


    def index
        @books = Book.where(nil)
        @books=Book.filter(params[:filter]) if params[:filter].present?
        render json: {books: @books}
    end

    def new
        @book = Book.new
    end
    
    def edit
    end

    def create
        if @current_user.admin?
            @book = Book.new(book_params)
            if@book.save
                render json:@book, status: :created, location:@book
            else
                render json:@book.errors, status: :unprocessable_entity
            end
        else
            render json:"Access Denied!! You can't add Books"
        end
    end

    def update
        if @current_user.admin?
            if@book.update(book_params)
                render json:@book
            else
                render json:@book.errors, status: :unprocessable_entity
            end
        else
            render json:"Access Denied!! You can't update Books"
        end
    end

    def destroy
        if @current_user.admin?
            @book.destroy
            render json: "The book is deleted"
        else
            render json: "Access Denied!! You can't Delete Books"
        end
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end
    

    def book_params
        params.require(:book).permit(:title,:author,:rating)
    end
end