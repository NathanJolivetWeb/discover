class CreatePartnerTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :partner_tasks do |t|
      t.references :partner, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
