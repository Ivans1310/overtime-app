require 'rails_helper'

RSpec.describe User, type: :model do
  before do ## This blpock will run in every one sogle test
    @user = User.create(email:"Test@test.com", password:"asdfasdf", password_confirmation:"asdfasdf", first_name:'Ivan', last_name:'Sanchez') 
  end
  describe "Creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
    it "can not be create without first_name and last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid 
    end
  end

  describe "Custom name method" do
    it "should create a full name combining the fisrt name with the last name"do
      expect(@user.full_name).to eq('SANCHEZ, IVAN')  
    end
  end

end
  
