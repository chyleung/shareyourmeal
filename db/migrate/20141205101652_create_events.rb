class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string "name"
      t.string "date" #need to change
      t.string "time" #need to change
      t.string "district"
      t.string "address"
      t.integer "max_attendee"
      t.integer "current_attendee"
      t.text "description"
      t.string "user_id"
      t.timestamps
    end
  end
end