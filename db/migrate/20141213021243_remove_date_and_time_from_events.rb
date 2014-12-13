class RemoveDateAndTimeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :date, :string
    remove_column :events, :time, :string
  end
end
