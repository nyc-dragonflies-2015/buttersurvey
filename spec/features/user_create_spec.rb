require 'rails_helper'

describe "UserController" do
  it "should have a UserController" do
    expect(UsersController).to_not be_nil
  end
end

describe "welcome page" do
  it "should include welcome message" do
    visit root_path
    expect(page).to have_content "WELCOME TO BUTTER SURVEYS"
  end
end

describe "sign up" do
  it "should create new user" do
    visit login_path
    within("#new_user") do
      fill_in 'user_name', :with => 'ben'
      fill_in 'user_email', :with => 'ben@example.com'
      fill_in 'user_password', :with => '123'
    end
    click_button 'Create User'
    expect(page).to have_content 'Account successfully created'
  end
end



# describe "create user" do
#   let!(:user) {User.create(name: "ben", email: "ben@example.com", password: "123") }
#   it "should let you create a new user" do
#   byebug

#   end
# end


