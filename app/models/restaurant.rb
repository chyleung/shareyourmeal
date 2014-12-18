class Restaurant < ActiveRecord::Base
	belongs_to :user
	belongs_to :district
	validates :phone, numericality: {only_interger: true, greater_than: 0}

def self.search_restaurant(name,district,latest)
  @restaurants = Restaurant.all.order(name: :asc)
  if name.present?
    @restaurants = @restaurants.where(["lower(restaurants.name) LIKE :query", query: "%#{name.downcase}%"])
  end
  if district.present?
    @restaurants = @restaurants.joins(:district).where(["lower(districts.name) LIKE :query", query: "%#{district.downcase}"])
  end
  if latest.present?
    @restaurants = @restaurants.where(created_at:(Date.today-30.day)..(Date.today+1))
  end
  @restaurants.order(name: :asc)
end

def nil.downcase
  " "
end

end