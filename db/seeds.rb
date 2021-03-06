# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

d1 = District.create!(name: "Wanchai")
d2 = District.create!(name: "Admiralty")
d3 = District.create!(name: "Central")
d4 = District.create!(name: "Sheung Wan")
d5 = District.create!(name: "Tin Hau")
d6 = District.create!(name: "Fortress Hill")
d7 = District.create!(name: "North Point")
d8 = District.create!(name: "Quarry Bay")
d9 = District.create!(name: "Tsim Sha Tsui")
d10 = District.create!(name: "Jordan")
d11 = District.create!(name: "Yau Ma Tei")
d12 = District.create!(name: "Mong Kok")
d13 = District.create!(name: "Prince Edward")
d14 = District.create!(name: "Kwun Tong")

u1 = User.create!(
	firstname: "Angela",
	lastname: "Baby",
	email: "angelababy@email.com",
	password: 12345678,
	districts:[d1,d2])
u2 = User.create!(
	firstname: "Janice",
	lastname: "Man",
	email: "janiceman@email.com",
	password: 12345678,
	districts:[d1])
u3 = User.create!(
	firstname: "Emma",
	lastname: "Watson",
	email: "emmawatson@email.com",
	password: 12345678,
	districts:[d2])

Restaurant.create!([
	{
		name: "Ming Restaurant",
		address: "21 Sam Pan St.",
		district_id: d1.id,
		phone: 55551234,
		coupon_type: "$25 for one standard meal",
		user_id: u1.id,
		},{
		name: "Lee Restaurant",
		address: "33 Lee Tong St.",
		district_id: d1.id,
		phone: 55557121,
		coupon_type: "$23 for one standard meal",
		user_id: u1.id,
		},{
		name: "Ching Restaurant",
		address: "50 Tai Yuen St.",
		district_id: d2.id,
		phone: 55555264,
		coupon_type: "$30 for one standard meal",
		user_id: u2.id,
		},{
		name: "Smarten Winner Restaurant",
		address: "4 Spring Garden Lane.",
		district_id: d2.id,
		phone: 55553344,
		coupon_type: "$20 for one standard meal",
		user_id: u2.id,
		},{
		name: "Chu Restaurant",
		address: "30 Johnston Rd.",
		district_id: d2.id,
		phone: 55556622,
		coupon_type: "$35 for one standard meal",
		user_id: u3.id,
		},
		])

Event.create!([
	{
		name: "Happy Eat-a-thon",
		date: "2014-09-15",
		time: "15:00",
		district_id: d1.id,
		address: "33 Queens Road East",
		max_attendee: 50,
		current_attendee: 0,
		description: "Fun day to eat",
		user_id: u1.id,
		attendees:[u1,u2,u3],
		},{
		name: "Sunday Sharing Event",
		date: "2015-04-03",
		time: "15:00",
		district_id: d1.id,
		address: "40 Jaffe Road",
		max_attendee: 30,
		current_attendee: 0,
		description: "Community sharing",
		user_id: u1.id,
		attendees:[u1,u2],
		},{
		name: "Thursday Sharing Event",
		date: "2015-04-01",
		time: "14:00",
		district_id: d2.id,
		address: "10 Tonnechy",
		max_attendee: 40,
		current_attendee: 0,
		description: "Community sharing",
		user_id: u2.id,
		attendees:[u2,u3],
		},
		])