# require 'rails_helper'

# describe "UserController" do
#   it "should have a UserController" do
#     expect(UsersController).to_not be_nil
#   end
# end

# describe "welcome page" do
#   it "should include welcome message" do
#     visit root_path
#     expect(page).to have_content "WELCOME TO BUTTER SURVEYS"
#   end
# end

# describe "sign up" do
#   it "should create new user" do
#     visit login_path
#     within("#new_user") do
#       fill_in 'user_name', :with => 'ben'
#       fill_in 'user_email', :with => 'ben@example.com'
#       fill_in 'user_password', :with => '123'
#     end
#     click_button 'Create User'
#     expect(page).to have_content 'Account successfully created'
#   end
# end


# describe "login" do
#   let!(:user) {User.create(name: "ben", email: "ben@example.com", password: "123") }
#   it "should let you log in" do
#     visit login_path
#     within("#login-form") do
#       fill_in 'Name', :with => user.name
#       fill_in 'user_password_digest', :with => user.password
#     end
#     click_button 'Save User'
#   end
# end

# describe "create survey" do
#   it "should create a new survey" do
#     visit new_survey_path
#     within("#new_survey") do
#       fill_in 'survey_name', :with => 'test survey'
#     end
#     click_button "Create Survey"
#     expect(Survey.last.name).to eq('test survey')
#   end

#   let!(:survey) {Survey.create(name: "test")}
#   it "should add a question" do
#     visit new_survey_question_path(survey.id)
#     within("#new_question") do
#       fill_in 'question_body', :with => 'new test question'
#     end
#     click_button "Create Question"
#     expect(Survey.last.questions.last.body).to eq('new test question')
#   end

#   # let!(:question){Survey.find_by(name: "test").questions.create(body: "test question")}
#   # it "should add choices to question" do
#   #   visit new_question_answer(Survey.last.questions.last.id)
#   #   within()
#   # end
# end


# # describe "create user" do
# #   let!(:user) {User.create(name: "ben", email: "ben@example.com", password: "123") }
# #   it "should let you create a new user" do
# #   byebug

# #   end
# # end


