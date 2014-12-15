class Event < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :attendees, class_name: "User"
	belongs_to :district
end
