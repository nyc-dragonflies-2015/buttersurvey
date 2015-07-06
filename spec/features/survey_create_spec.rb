require 'rails_helper'

feature "create survey" do
  given!(:user) {User.create(name: "bananas", email: "bananas@example.com", password: "123")}
  given!(:survey) {Survey.create(name: "bananas-survey", url: "www.example.com", creator_id: user.id)}
  it "should allow a logged in user to view their created surveys" do
    visit '/login'
    within("#login-form") do
      fill_in 'Name', with: user.name
      fill_in 'user_password_digest', with: user.password
    end
    click_button 'Save User'
    click_link "#{user.name}"
    click_link "#{survey.name}"
    expect(page).to have_content "Survey #{survey.name}"
  end
end
