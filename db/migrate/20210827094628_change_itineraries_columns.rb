class ChangeItinerariesColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :itineraries, :address_start, :string
    remove_column :itineraries, :address_end, :string
    add_column :itineraries, :name, :string
    add_column :itineraries, :order, :integer
  end
end
