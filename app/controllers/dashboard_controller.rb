class DashboardController < ApplicationController
  def index
    @creators = Creator.with_payouts_summary
  end
end