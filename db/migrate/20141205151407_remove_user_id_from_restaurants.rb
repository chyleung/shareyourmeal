class RemoveUserIdFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :user_id, :string
  end
end
