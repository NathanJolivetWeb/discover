class AddDefaultToOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :steps, :order, :integer, default: 0
  end
end
