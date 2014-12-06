class AddDistrictToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :district, :string
  end
end
