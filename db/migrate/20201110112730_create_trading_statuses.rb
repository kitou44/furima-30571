class CreateTradingStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :trading_statuses do |t|

      t.timestamps
    end
  end
end
