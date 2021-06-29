class CreateClicks < ActiveRecord::Migration[5.2]
  def change
    create_table :clicks do |t|
      t.integer :link_id, null: false
      t.string :ip_address

      t.timestamps
    end
  end
end
