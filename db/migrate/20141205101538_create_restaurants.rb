class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string "name"
      t.string "address"
      t.integer "phone"
      t.text  "coupon_type"
      t.string "user_id"
      t.timestamps
    end
  end
end
