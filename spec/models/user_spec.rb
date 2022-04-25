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
end
