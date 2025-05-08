class SendPaymentJob < ApplicationJob
  queue_as :default

  def perform(payout)
    payout.mark_as_paid
  end
end
