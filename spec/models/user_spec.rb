require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user validations" do
    it "should have password and matching password confirmation" do
      @user = User.new(password: '123abc', password_confirmation: '123abc', email: 'test@test.com', name: "Dante")
    expect(@user).to be_valid
    end

    it "should not pass if name is missing" do
      @user = User.new(password: '123abc', password_confirmation: '123abc', email: 'test@test.com')
    expect(@user).to be_invalid
    end

    it "should not pass if password confirmation does not match password" do
      @user = User.new(password: '123abc', password_confirmation: '123456', email: 'test@test.com', name: "Dante")
    expect(@user).to be_invalid
    end

    it "should not pass if password is too short" do
      @user = User.new(password: '1a', password_confirmation: '1a', email: 'test@test.com', name: "Dante")
    expect(@user).to be_invalid
    end

    it "email should be unique" do
      @user = User.create(name: 'foo', email: 'foo@bar.com', password: 'password', password_confirmation: 'password')
      @user2 = User.create(name: 'test', email: 'FOO@bar.com', password: 'password', password_confirmation: 'password')
      @user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    describe '.authenticate_with_credentials' do
      before(:each) do
        @user = User.create(name: 'foo', email: 'foo@bar.com', password: 'password', password_confirmation: 'password')
      end
  
      it "email is not case-sensitive" do
        expect(User.authenticate_with_credentials("FOO@bar.com", "password")).to be_truthy
      end
  
      it "ignores white space in email" do
        expect(User.authenticate_with_credentials("  FOO@bar.com  ", "password")).to be_truthy
      end
    end
end
