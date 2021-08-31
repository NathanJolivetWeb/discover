class AddDurationToItinerary < ActiveRecord::Migration[6.0]
  def change
    add_column :itineraries, :duration, :float
  end
end
