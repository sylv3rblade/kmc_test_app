require 'rails_helper'

RSpec.describe SendPaymentJob, type: :job do
  let(:payout) { create(:payout, status: 'pending') }

  it 'marks the payout as paid' do
    expect {
      SendPaymentJob.perform_now(payout)
    }.to change { payout.reload.status }.from('pending').to('paid')
  end
end
