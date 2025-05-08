require 'rails_helper'

RSpec.describe PayoutsController, type: :request do
  describe 'GET /payouts' do
    let!(:payout1) { create(:payout) }
    let!(:payout2) { create(:payout) }

    it 'renders the index template and lists payouts' do
      get payouts_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(payout1.id.to_s)
      expect(response.body).to include(payout2.id.to_s)
    end
  end

  describe 'POST /payouts/:id/send_payment' do
    let!(:payout) { create(:payout, status: 'pending') }

    it 'calls SendPaymentJob and redirects with notice' do
      expect_any_instance_of(SendPaymentJob).to receive(:perform).with(payout)

      post send_payment_payout_path(payout)

      expect(response).to redirect_to(payouts_path)
    end
  end
end
