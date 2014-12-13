class CreateJoinTableDistrictUser < ActiveRecord::Migration
  def change
    create_join_table :districts, :users do |t|
      # t.index [:district_id, :user_id]
      # t.index [:user_id, :district_id]
    end
  end
end
