require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.create(:password => "password", :password_confirmation => "password", :email => "ellie@ellie.com", :first_name => "Test", :last_name => "Test")
    end
    it "Is valid if password and password confirmation fields match" do
      expect(@user).to be_valid
    end
    it "Is not valid if password and password confirmation fields do not match" do
      @user.password = "Password"
      expect(@user).to_not be_valid
    end
    it "Is not valid if email field is blank" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it "Is not valid if first_name field is blank" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end
    it "Is not valid if email field is blank" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it "Is not valid if email already exists in db" do
      @duplicate = User.create(:password => "password", :password_confirmation => "password", :email => "ellie@ellie.com", :first_name => "Test", :last_name => "Test")
      expect(@duplicate).to_not be_valid
    end
    it "Is not valid if password is less than 4 characters" do
      @user.password = "el"
      @user.password_confirmation = "el"
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before(:all) do
      @user = User.create({
        first_name: "Ellie",
        last_name: "Meatball",
        email: "ellie_the_dog@gmail.com",
        password: "test",
        password_confirmation: "test"
      })
    end 
    it "does not return nil when correct email and password provided" do
      @email = "ellie_the_dog@gmail.com"
      @password = "test"
      @user2 = User.authenticate_with_credentials(@email, @password)
      expect(@user2).not_to be_nil
    end
    it "returns nil if incorrect email provided" do
      @email = "ellie@gmail.com"
      @password = "test"
      @user2 = User.authenticate_with_credentials(@email, @password)
      expect(@user2).to be_nil
    end
    it "returns nil if incorrect password provided" do
      @email = "ellie@gmail.com"
      @password = "testy"
      @user2 = User.authenticate_with_credentials(@email, @password)
      expect(@user2).to be_nil
    end
    it "authenticates user if space added before email" do
      @email = " ellie_the_dog@gmail.com"
      @password = "test"
      @user2 = User.authenticate_with_credentials(@email, @password)
      expect(@user2).not_to be_nil
    end
    it "authenticates user if space added before email" do
      @email = "ellie_the_dog@gmail.com "
      @password = "test"
      @user2 = User.authenticate_with_credentials(@email, @password)
      expect(@user2).not_to be_nil
    end
    it "authenticates user if email has incorrect casing" do
      @email = "ellie_THE_dog@gmail.com"
      @password = "test"
      @user2 = User.authenticate_with_credentials(@email, @password)
      expect(@user2).not_to be_nil
    end
  end
end
