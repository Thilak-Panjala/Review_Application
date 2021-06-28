require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "User should be valid" do
        @user=User.new(username:'thilak',email:'thilak@gmail.com',password:'thilak')
        assert @user.valid?
    end
    test 'Username cannot be empty' do
        @user=User.new(username:'',email:'thilak@gmail.com',password:'thilak')
        assert_not @user.valid?
    end

    test 'Email cannot be empty' do
        @user=User.new(username:'thilak',email:'',password:'thilak')
        assert_not @user.valid?
    end

    test 'Password cannot be empty' do
        @user=User.new(username:'thilak',email:'thilak@gmail.com',password:'')
        assert_not @user.valid?
    end

    test 'Email must be unique' do
        @user=User.new(username:'thilak',email:'thilak@gmail.com',password:'thilak')
        @user.save
        @user1=User.new(username:'thilak',email:'thilak@gmail.com',password:'thilak')
        assert_not @user1.valid?
    end
end