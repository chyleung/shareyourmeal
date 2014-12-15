class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events
  has_and_belongs_to_many :districts
  has_and_belongs_to_many :attendances, class_name: "Event"
  has_many :restaurants
  validates :firstname, :lastname, presence: true
end
