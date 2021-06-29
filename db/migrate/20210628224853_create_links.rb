class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :full_url, null: false
      t.string :slug, null: false

      t.timestamps
    end
  end
end
