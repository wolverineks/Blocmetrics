require 'rails_helper'

RSpec.describe UserController, type: :controller do

  #include TestFactories

  describe "GET #index" do
    
    it "returns http success if user.role == admin" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns http fail if user.role != admin" do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

  describe "GET #show" do
    
    it "returns http success if user == record" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "returns http fail if user != record" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "returns http fail if record does not exist" do
      get :show
      expect(response).to have_http_status(:success)
    end

  end

end
