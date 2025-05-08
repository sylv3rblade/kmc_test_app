require 'rails_helper'

RSpec.describe "Creators", type: :request do
  let!(:creator) { create(:creator) }

  describe "GET /creators" do
    it "returns a successful response" do
      get creators_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /creators/:id" do
    it "shows a creator" do
      get creator_path(creator)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(creator.name)
    end
  end

  describe "POST /creators" do
    it "creates a new creator" do
      expect {
        post creators_path, params: {
          creator: attributes_for(:creator, name: "New Creator", email: "new@example.com")
        }
      }.to change(Creator, :count).by(1)
      expect(response).to redirect_to(creator_path(Creator.last))
    end
  end

  describe "PATCH /creators/:id" do
    it "updates the creator" do
      patch creator_path(creator), params: {
        creator: { name: "Updated Name" }
      }
      expect(response).to redirect_to(creator_path(creator))
      expect(creator.reload.name).to eq("Updated Name")
    end
  end

  describe "DELETE /creators/:id" do
    it "deletes the creator" do
      expect {
        delete creator_path(creator)
      }.to change(Creator, :count).by(-1)
      expect(response).to redirect_to(creators_path)
    end
  end
end