class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :cuisine, null: false
      t.integer :user_id, null: false

      t.timestamps(null: false)
    end
  end
end
