class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.references :user, null: false, foreign_key: true
      t.references :roadtrip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
