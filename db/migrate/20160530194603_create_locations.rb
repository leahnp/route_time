class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address, null: false
      t.string :user_id, null: false

      t.timestamps null: false
    end
  end
end
