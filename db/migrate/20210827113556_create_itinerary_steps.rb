class CreateItinerarySteps < ActiveRecord::Migration[6.0]
  def change
    create_table :itinerary_steps do |t|
      t.references :step, null: false, foreign_key: true
      t.references :itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
