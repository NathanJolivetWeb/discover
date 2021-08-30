class AddDistanceToItinerary < ActiveRecord::Migration[6.0]
  def change
    add_column :itineraries, :distance, :float
  end
end
