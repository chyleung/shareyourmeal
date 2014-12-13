class RenameDistrictToNameInDistricts < ActiveRecord::Migration
  def change
    change_table :districts do |t|
      t.rename :district, :name
    end
  end
end
