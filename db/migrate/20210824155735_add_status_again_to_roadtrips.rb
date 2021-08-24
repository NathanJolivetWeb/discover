class AddStatusAgainToRoadtrips < ActiveRecord::Migration[6.0]
  def change
    add_column :roadtrips, :status, :string, default: "En cours"
  end
end
