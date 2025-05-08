class CreatePayouts < ActiveRecord::Migration[8.0]
  def change
    create_table :payouts do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.string :status
      t.datetime :paid_at

      t.timestamps
    end
  end
end
