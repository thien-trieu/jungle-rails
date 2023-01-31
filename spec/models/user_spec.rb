require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it "Error message for User instance if the 'password' is nil" do
      @user = User.new(first_name: "test", last_name: "test", password: nil, password_confirmation: "testing", email: "test@test.com")
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end



    it "Error message for User instance if the 'password_confirmation' is nil." do
      @user = User.new(first_name: "test", last_name: "test", password: "testing", password_confirmation: nil, email: "test@test.com")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end



    it "Error message if Password and password_confirmation fields do not match" do
      @user = User.new(first_name: "test", last_name: "test", password: "testing1", password_confirmation: "testing", email: "test@test.com")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "Error message if Password does not meet minimum length" do
      @user = User.new(first_name: "test", last_name: "test", password: "test", password_confirmation: "test", email: "test@test.com")
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "Email must be unique. No duplicate emails. Not case sensitive." do
      @user1 = User.new(first_name: "test", last_name: "test", password: "testing", password_confirmation: "testing", email: "test@test.com")
      @user1.save
      @user2 = User.new(first_name: "test", last_name: "test", password: "testing", password_confirmation: "testing", email: "test@test.com")
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
      
    end

    it "Error message for User instance if the 'email' is nil." do
      @user = User.new(first_name: "test", last_name: "test", password: "testing", password_confirmation: "testing", email: nil)
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "Error message for User instance if the 'last name' is nil." do
      @user = User.new(first_name: "test", last_name: nil, password: "testing", password_confirmation: "testing", email:"test@test.com")
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "Error message for User instance if the 'first name' is nil." do
      @user = User.new(first_name: nil, last_name: "test", password: "testing", password_confirmation: "testing", email:"test@test.com")
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do

    it "User can log in when credentials match" do
      @user = User.new(first_name: "test", last_name: "test", password: "testing", password_confirmation: "testing", email:"test@test.com")
      @user.save
      expect(User.authenticate_with_credentials("test@test.com", "testing")).to be_present
    end

    it "User can log in, email is not case sensitive." do
      @user = User.new(first_name: "test", last_name: "test", password: "testing", password_confirmation: "testing", email:"test@test.com")
      @user.save
      expect(User.authenticate_with_credentials("test@TEST.com", "testing")).to be_present
    end

    it "User can log in with email, even if there is whitespace before and after email" do
      @user = User.new(first_name: "test", last_name: "test", password: "testing", password_confirmation: "testing", email:"test@test.com")
      @user.save
      expect(User.authenticate_with_credentials("   test@test.com  ", "testing")).to be_present
    end

    it "User can NOT log in when password do not match" do
      @user = User.new(first_name: "test", last_name: "test", password: "testing", password_confirmation: "testing", email:"test@test.com")
      @user.save
      expect(User.authenticate_with_credentials("test@test.com", "testingWrongPassword")).not_to be_present
    end

    it "User can NOT log in when email do not match" do
      @user = User.new(first_name: "test", last_name: "test", password: "testing", password_confirmation: "testing", email:"test@test.com")
      @user.save
      expect(User.authenticate_with_credentials("test@testWrongEmail.com", "testing")).not_to be_present
    end

  end

end