require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, user: { name: "KG", password: "" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present

        post :create, user: { name: "", password: "2Kings" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post :create, user: { name: "KG", password: "test" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects user to links[sic, actually \"subs\"] index on success" do
        post :create, user: { name: "KG", password: "2Kings" }
        expect(response).to redirect_to(subs_url)
      end
    end
  end

end
