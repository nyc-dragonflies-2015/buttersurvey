require 'rails_helper'

describe UsersController do
  describe "user#create" do
    let!(:user) {User.new(name:"test", email: "test@example.com", password:"123")}
    it "should create a new user" do
      post :create, {user: {name: user.name, email: user.email, password: user.password}}
      expect(response).to redirect_to root_path
    end
  end
  describe "user#create" do
    let!(:user) {User.new(name:"test", email: "test@example.com", password:"123")}
    it "should not create a new user without required parameters" do
      post :create, {user: {name: user.name, email: user.email, password: nil}}
      expect(response).to redirect_to login_path
    end
  end

end
