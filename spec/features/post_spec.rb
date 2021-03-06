require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Ivan", last_name: "Sanchez")
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
      
    end
    
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Post' do
      expect(page).to have_content(/Post/)
    end
    it 'has a title of Post' do
      post1 = Post.create(date: Date.today, rationale: "Post1", user_id: @user.id)
      post2 = Post.create(date: Date.today, rationale: "Post2", user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/Post1|Pots2/)
    end
  end

  describe 'creation' do

    before do
      visit new_post_path
    end
    
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'Can be created from a new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"
      expect(page).to have_content("Some rationale")
    end 

    
    it 'Will have a user associated it ' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Association")
    end 

  end
end

