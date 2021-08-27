class RemoveColumnToSteps < ActiveRecord::Migration[6.0]
  def change
    remove_column :steps, :itinerary_id
  end
end
