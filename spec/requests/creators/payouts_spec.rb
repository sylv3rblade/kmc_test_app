require 'rails_helper'

RSpec.describe Creators::PayoutsController, type: :controller do
  let!(:creator) { create(:creator) }
  let(:valid_attributes) { { amount: 100 } }
  let(:invalid_attributes) { { amount: nil } }

  describe 'GET #new' do
    it 'assigns a new payout to @payout' do
      get :new, params: { creator_id: creator.id }
      expect(assigns(:payout)).to be_a_new(Payout)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new payout' do
        expect {
          post :create, params: { creator_id: creator.id, payout: valid_attributes }
        }.to change(Payout, :count).by(1)
      end

      it 'redirects to the creators list with a success notice' do
        post :create, params: { creator_id: creator.id, payout: valid_attributes }
        expect(response).to redirect_to(creators_url)
        expect(flash[:notice]).to eq('Payout created successfully.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new payout' do
        expect {
          post :create, params: { creator_id: creator.id, payout: invalid_attributes }
        }.not_to change(Payout, :count)
      end

      it 're-renders the new template with an error message' do
        post :create, params: { creator_id: creator.id, payout: invalid_attributes }
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)  # Unprocessable entity
      end
    end
  end
end
