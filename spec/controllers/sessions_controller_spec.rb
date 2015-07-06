require 'rails_helper'

describe SessionsController do
  describe "GET /new" do
    it "should render a form for signing in" do
      get :new
      expect(response).to render_template("new")
    end
  end
end
