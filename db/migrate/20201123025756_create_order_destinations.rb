class CreateOrderDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :order_destinations do |t|

      t.timestamps
    end
  end
end
