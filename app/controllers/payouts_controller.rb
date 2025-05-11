class PayoutsController < ApplicationController
  before_action :set_payout, only: [:send_payment]

  def index
    @payouts = Payout.all.includes(:creator)
  end

  def send_payment
    SendPaymentJob.new.perform(@payout)
    @index = Payout.count - 1 # not ideal but works for presentation
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to payouts_url, notice: 'Payout successfully enqueued' }
    end
  end

  private

  def set_payout
    @payout = Payout.find(params[:id])
  end
end