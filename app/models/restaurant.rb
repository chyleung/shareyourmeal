class Restaurant < ActiveRecord::Base
	belongs_to :user
	belongs_to :district
	
  validates :name, presence: true
  validates :address, presence: true
  validates :district, presence: true
  validates :phone, presence: true, length: { is: 8}
  validates :coupon_type, presence: true

def self.search_restaurant(name,district,latest)
  @restaurants = Restaurant.all.order(name: :asc)
  if name.present?
    @restaurants = @restaurants.where(["lower(restaurants.name) LIKE :query", query: "%#{name.downcase}%"])
  end
  if district.present?
    @restaurants = @restaurants.joins(:district).where(["lower(districts.name) LIKE :query", query: "%#{district.downcase}%"])
  end
  if latest.present?
    @restaurants = @restaurants.where(created_at:(Date.today-30.day)..(Date.today+1.day))
  end
  @restaurants.order(name: :asc)
end

def nil.downcase
  " "
end

end