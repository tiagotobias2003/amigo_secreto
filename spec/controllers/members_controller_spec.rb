require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryBot.create(:user)
    sign_in @current_user
  end

  describe "POST #create" do
    before(:each) do
      @campaign = FactoryBot.create(:campaign, user: @current_user)
    end

    it "Return http success" do
      member = FactoryBot.attributes_for(:member)
      post :create, params: {member: {name: member[:name], email: member[:email], campaign_id: @campaign.id}}, :format => :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @campaign = FactoryBot.create(:campaign, user: @current_user)
    end

    it "returns http success" do
      member = FactoryBot.create(:member, campaign: @campaign)
      delete :destroy, params: {id: member.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    before(:each) do
      @campaign = FactoryBot.create(:campaign, user: @current_user)
      @member = FactoryBot.create(:member, campaign: @campaign)
      @new_member_attributes = FactoryBot.attributes_for(:member)
      request.env["HTTP_ACCEPT"] = 'application/json'
      put :update, params: {id: @member.id, member: @new_member_attributes}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

  end


end