require 'test_helper'

class BookTest < ActiveSupport::TestCase
    test "Book should be valid" do
        @book=Book.new(title:'test_book',author:'test_author',rating:9.5)
        assert @book.valid?
    end
    test 'Title cannot be empty' do
        @book = Book.new(title: '', author: 'test_author', rating: 9.5)
        assert_not @book.valid?
      end
    
      test 'Author cannot be empty' do
        @book = Book.new(title:'test_book', author: ' ', rating: 9.5)
        assert_not @book.valid?
      end
    
      test 'Rating cannot be empty' do
        @book = Book.new(title:'test_book', author: 'test_author', rating:'')
        assert_not @book.valid?
      end
    
      test 'Rating cannot be greater than 10' do
        @book = Book.new(title:'test_book', author: 'test_author', rating: 11)
        assert_not @book.valid?
      end
    
      test 'Rating cannot be less than 0' do
        @book = Book.new(title:'test_book', author: 'test_author', rating: -9.5)
        assert_not @book.valid?
      end

    test 'Title must be unique' do
        @book = Book.new(title:'test_book', author: 'test_author', rating: 9.5)
        @book.save
        @book1= Book.new(title:'test_book', author: 'test_author', rating: 9.5)
        assert_not @book1.valid?
    end
end