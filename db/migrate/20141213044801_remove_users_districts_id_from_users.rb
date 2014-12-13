class RemoveUsersDistrictsIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :users_districts_id, :integer
  end
end
