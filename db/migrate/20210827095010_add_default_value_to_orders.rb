class AddDefaultValueToOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :itineraries, :order, :integer, default: 0
  end
end
