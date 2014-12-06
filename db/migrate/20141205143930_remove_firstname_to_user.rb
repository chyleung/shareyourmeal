class RemoveFirstnameToUser < ActiveRecord::Migration
  def change
    remove_column :users, :firstname, :integer
  end
end
