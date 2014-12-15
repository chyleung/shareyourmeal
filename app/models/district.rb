class District < ActiveRecord::Base
	has_many :restaurants
	has_many :events
	has_and_belongs_to_many :users
end
