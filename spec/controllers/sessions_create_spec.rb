require 'rails_helper'

describe SessionsController do
  it "should have a SessionsController" do
    expect(SessionsController).to_not be_nil
  end

  describe "login" do
    it "should render the login form" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "login" do
    let!(:user) {User.create(name: "ben", email: "ben@example.com", password: "123")}
    it "should create a new session when information is correct" do
      post :create, user: {name: user.name, password: "123"}
      expect(session[:user_id]).to_not be_nil
    end
  end

  describe "login" do
    let!(:user) {User.create(name: "jim", email: "jim@example.com", password: "123")}
    it "should NOT create a new session when information is INcorrect" do
      post :create, user: {name: "JoJOOO", password: "1sdf23"}
      expect(session[:user_id]).to be_nil
    end
  end

end





