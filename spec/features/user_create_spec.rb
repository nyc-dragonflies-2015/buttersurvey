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


