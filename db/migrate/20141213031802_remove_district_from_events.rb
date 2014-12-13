class RemoveDistrictFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :district, :string
  end
end
