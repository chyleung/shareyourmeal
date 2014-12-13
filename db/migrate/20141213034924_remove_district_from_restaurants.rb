class RemoveDistrictFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :district, :string
  end
end
