class ChangeDefaultStatusForPayouts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :payouts, :status, from: nil, to: 'pending'
  end
end
