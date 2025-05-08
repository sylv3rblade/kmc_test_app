class Creators::PayoutsController < ApplicationController
  before_action :set_creator

  def new
    @payout = Payout.new
  end

  def create
    @payout = @creator.payouts.build(payout_params)
    if @payout.save
      redirect_to creators_url, notice: 'Payout created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_creator
    @creator = Creator.find(params[:creator_id])
  end

  def payout_params
    params.require(:payout).permit(:amount)
  end
end
