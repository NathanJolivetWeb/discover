class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :requester, null: false
      t.references :addressed, null: false

      t.timestamps
    end
    add_foreign_key :friendships, :users, column: :requester_id
    add_foreign_key :friendships, :users, column: :addressed_id
  end
end
