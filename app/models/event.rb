class Event < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :attendees, class_name: "User"
  belongs_to :district

  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :district, presence: true
  validates :address, presence: true

  def self.calc_date(date_range)
    if date_range == "past events"
      @events.where("date < ?", Date.today)
    elsif date_range == "today"
      @events.where(date:(Date.today-1.day)..(Date.today+1.day))
    elsif date_range == "this week"
      @events.where(date:(Date.today-1.day)..(Date.today+7.day))
    elsif date_range == "this month"
      @events.where(date:(Date.today-1.day)..(Date.today+30.day))
    else
      @events.all
    end
  end

  def self.search_event(name,district,time)
    @events = Event.where("date >= ?", Date.today).order(date: :asc)
    if time.present? && time == "Past Events"
      @events = Event.all
      if name.present?
        @events = @events.where(["lower(events.name) LIKE :query", query: "%#{name.downcase}%"])
      end
      if district.present?
        @events = @events.joins(:district).where(["lower(districts.name) LIKE :query", query: "%#{district.downcase}%"])
      end
      if time.present?
        @events = calc_date("#{time.downcase}")
      end
    else
      if name.present?
        @events = @events.where(["lower(events.name) LIKE :query", query: "%#{name.downcase}%"])
      end
      if district.present?
        @events = @events.joins(:district).where(["lower(districts.name) LIKE :query", query: "%#{district.downcase}%"])
      end
      if time.present?
        @events = calc_date("#{time.downcase}")
      else
      end
      @events.order(date: :asc)
    end
  end

  def nil.downcase
    " "
  end

  def iscreator
    if @event.user.email == @event.attendee.email
      "Creator"
    else
      "Participant"
    end
  end
end
