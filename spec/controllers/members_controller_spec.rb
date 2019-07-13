require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryBot.create(:user)
    sign_in @current_user
  end

  describe "POST #create" do
    before(:each) do
      @member = FactoryBot.attributes_for(:member, user: @current_user)
      post :create, params: {member: @member}
    end

    it "Return success create member" do
      expect(response).to have_http_status(200)
      #expect(response).to redirect_to("/campaigns/#{Campaign.last.id}")
    end
  end


end