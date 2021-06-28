require 'test_helper'

class PostTest < ActiveSupport::TestCase
    setup do
        @book = Book.create(title: 'Test', author: 'Test', rating: 1)
        @user = User.create(username: 'Test', email: 'Test@gmail.com', password: '123')
    end

    test 'Post is valid' do
        @post = Post.new(review: 'This is a test post', commantable_type: 'Book', commantable_id: @book.id, user_id: @user)
        assert @post.valid?
    end

    test 'Type should not be empty' do
        @post = Post.new(review: 'This is a test post', commantable_type: '', commantable_id: @book.id, user_id: @user)
        assert_not @post.valid?
    end

    test 'User should not be empty' do
        @post = Post.new(review: 'This is a test post', commantable_type: '', commantable_id: @book.id, user_id: '')
        assert_not @post.valid?
    end
    
    test 'Id should not be empty' do
        @post = Post.new(review: 'This is a test post', commantable_type: 'Book', commantable_id:'', user_id: @user)
        assert_not @post.valid?
    end
end