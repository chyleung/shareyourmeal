class AddNameAndDateAndTimeAndDistrictAndAddressAndMaxAttendeeAndCurrentAttendeeAndDescriptionAndUserIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :name, :string
    add_column :events, :date, :string
    add_column :events, :time, :string
    add_column :events, :district, :string
    add_column :events, :address, :string
    add_column :events, :max_attendee, :integer
    add_column :events, :current_attendee, :integer
    add_column :events, :description, :text
    add_column :events, :user_id, :string
  end
end
