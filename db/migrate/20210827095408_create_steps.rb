class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.integer :order
      t.string :address
      t.references :itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
