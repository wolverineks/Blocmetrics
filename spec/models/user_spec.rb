require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "role check" do

    before do
      @user  = User.create(name: 'test user', password: "helloworld", role: "member")
      @admin  = User.create(name: 'admin user', password: "helloworld", role: "admin")
    end

    it "returns true only if user role is member" do
      expect(@user.admin?).to be false
      expect(@user.member?).to be true
    end

    it "returns true only if user role is admin" do
      expect(@admin.admin?).to be true
      expect(@admin.member?).to be false
    end
  end

  describe "delete associated registered applications when user is deleted" do

    before do
      @user  = User.create(name: 'test user', password: "helloworld", role: "member")
      @registered_application =  RegisteredApplication.create(name: 'test application', url: "www.example.com", user: @user)
    end 

    it "returns nil if associated user is deleted" do
      expect(@registered_application.user).to be(@user)
      @user.destroy
      expect(@registered_application).to be(nil)
    end

  end

end
