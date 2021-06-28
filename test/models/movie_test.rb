require 'test_helper'

class MovieTest < ActiveSupport::TestCase
    test "Movie should be valid" do
        @movie=Movie.new(title:'chathrapathi',director:'rajamouli',rating:9.5)
        assert @movie.valid?
    end
    test 'Title cannot be empty' do
        @movie = Movie.new(title: '', director: 'rajamouli', rating: 9.5)
        assert_not @movie.valid?
    end
    
    test 'Director cannot be empty' do
        @movie = Movie.new(title:'chathrapathi', director: ' ', rating: 9.5)
        assert_not @movie.valid?
    end
    
    test 'Rating cannot be empty' do
        @movie = Movie.new(title:'chathrapathi', director: 'rajamouli', rating:'')
        assert_not @movie.valid?
    end
    
    test 'Rating cannot be greater than 10' do
        @movie = Movie.new(title:'chathrapathi', director: 'rajamouli', rating: 11)
        assert_not @movie.valid?
    end
    
    test 'Rating cannot be less than 0' do
        @movie = Movie.new(title:'chathrapathi', director: 'rajamouli', rating: -9.5)
        assert_not @movie.valid?
    end

    test 'Title must be unique' do
        @movie = Movie.new(title:'chathrapathi', director: 'rajamouli', rating: 9.5)
        @movie.save
        @movie1= Movie.new(title:'chathrapathi', director: 'rajamouli', rating: 9.5)
        assert_not @movie1.valid?
    end
end