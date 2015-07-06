require 'rails_helper'

describe SessionsController do
  describe "GET /new" do
    it "should render a form for signing in" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST/sessions" do
    let!(:user) {User.create(name:"test", email: "test@example.com", password:"123")}
    it "should sign in a user" do
      post :create, {user: {name: user.name, password: user.password}}
      expect(response).to redirect_to root_path
    end
    it "should not sign in an unauthenticated user" do
      post :create, {user: {name: nil, password: nil} }
      expect(response).to redirect_to login_path
    end
  end

end