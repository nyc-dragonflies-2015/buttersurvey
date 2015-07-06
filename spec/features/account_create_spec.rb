require 'rails_helper'

feature "create account" do
  given!(:user) {User.new(name: "tacos", email: "tacos@example.com", password: "123")}
  it "should create a new user" do
    visit '/login'
    within("#create-account-form") do
      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Create User'
    expect(page).to have_content "Account successfully created"
  end
end

feature "create account" do
  given!(:user) {User.create(name: "tacos", email: "tacos@example.com", password: "123")}
  given!(:dup_user) {User.new(name: "tacos", email: "tacos@example.com", password: "123")}
  it "should not allow duplicate user creation" do
    visit '/login'
    within("#create-account-form") do
      fill_in 'Name', with: dup_user.name
      fill_in 'Email', with: dup_user.email
      fill_in 'Password', with: dup_user.password
    end
    click_button 'Create User'
    expect(page).to have_content "User already exists"
  end
end

feature "login" do
  given!(:user) {User.create(name: "bananas", email: "bananas@example.com", password: "123")}
  it "should allow a registered user to login" do
    visit '/login'
    within("#login-form") do
      fill_in 'Name', with: user.name
      fill_in 'Password', with: user.password
    end
    click_button 'Save User'
    expect(page).to have_content "#{user.name} logout"
  end

  it "should not login a user that does not exist" do
    visit '/login'
    within("#login-form") do
      fill_in 'Name', with: nil
      fill_in 'Password', with: nil
    end
    click_button 'Save User'
    expect(page).to have_content "Invalid Username or Password"
  end
end

feature "user profile" do
  given!(:user) {User.create(name: "bananas", email: "bananas@example.com", password: "123")}
  it "should allow a logged in user to view their profile" do
    visit '/login'
    within("#login-form") do
      fill_in 'Name', with: user.name
      fill_in 'Password', with: user.password
    end
    click_button 'Save User'
    click_link "#{user.name}"
    expect(page).to have_content "My Account"
  end
end

feature "logout" do
  given!(:user) {User.create(name: "bananas", email: "bananas@example.com", password: "123")}
  it "should allow a logged in user to logout" do
    visit '/login'
    within("#login-form") do
      fill_in 'Name', with: user.name
      fill_in 'Password', with: user.password
    end
    click_button 'Save User'
    click_link "logout"
    expect(page).to have_content "login"
  end
end


