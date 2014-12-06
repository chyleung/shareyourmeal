class AddNameAndAddressAndPhoneAndCouponTypeAndUserIdToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :name, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :phone, :integer
    add_column :restaurants, :coupon_type, :text
    add_column :restaurants, :user_id, :string
  end
end
