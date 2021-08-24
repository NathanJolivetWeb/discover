class CreateItineraries < ActiveRecord::Migration[6.0]
  def change
    create_table :itineraries do |t|
      t.string :address_start
      t.string :address_end
      t.references :roadtrip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
