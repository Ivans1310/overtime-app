require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Creation" do
    before do ## This blpock will run in every one sogle test
      @user = User.create(email:"Test@test.com", password:"asdfasdf", password_confirmation:"asdfasdf", first_name:'test fisrt Name', last_name:'test last name') 
      
    end
    it "can be created" do
      expect(@user).to be_valid
    end
    it "can not be create without first_name and last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid 
    end
  end

end
