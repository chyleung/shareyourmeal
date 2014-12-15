class Restaurant < ActiveRecord::Base
	belongs_to :user
	belongs_to :district
	validates :phone, numericality: {only_interger: true, greater_than: 0}
end
