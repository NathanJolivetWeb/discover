class AddColumnsToRoadtrips < ActiveRecord::Migration[6.0]
  def change
    add_column :roadtrips, :start_date, :string
    add_column :roadtrips, :end_date, :string
  end
end
