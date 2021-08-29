class AddOwnerToRoadtrips < ActiveRecord::Migration[6.0]
  def change
    add_column :roadtrips, :owner, :integer
  end
end
