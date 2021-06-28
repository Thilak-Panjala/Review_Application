require "test_helper"

class CommentTest < ActiveSupport::TestCase
    setup do
        @book = Book.create(title: 'Test', author: 'Test', rating: 1)
        @user = User.create(username: 'Test', email: 'Test@gmail.com', password: '123')
        @post = Post.new(review: 'This is a test post', commantable_type: 'Book', commantable_id: @book.id, user_id: @user)    
    end

    test 'comment should be valid' do
        @comment=Comment.new(statement:'this is a comment',post: @post,user_id:@user)
        assert_not @comment.valid?
    end

    test 'comment should not be empty' do
        @comment=Comment.new(statement:'',post: @post,user_id:@user)
        assert_not @comment.valid?
    end
end