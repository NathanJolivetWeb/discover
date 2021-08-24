class CreateRoadtrips < ActiveRecord::Migration[6.0]
  def change
    create_table :roadtrips do |t|
      t.string :title

      t.timestamps
    end
  end
end
