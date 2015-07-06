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
