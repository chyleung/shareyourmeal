# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

District.create!([
	{
	name: "Wanchai"
	},{
	name: "Admiralty" 
	},{
	name: "Tin Hau"
	}])

User.create!([
	{
	firstname: "Angela",
	lastname: "Baby",
	email: "angelababy@email.com",
	encrypted_password: 1234567,
	},{
	firstname: "Janice",
	lastname: "Man",
	email: "janiceman@email.com",
	encrypted_password: 1234567,
	},{
	firstname: "Emma",
	lastname: "Watson",
	email: "emmawatson@email.com",
	encrypted_password: 1234567,
	},
	])

Restaurant.create!([
	{
		name: "Ming Restaurant",
		address: "21 Sam Pan St.",
		district_id: 1,
		phone: 55551234,
		coupon_type: "$25 for one standard meal",
		user_id: 1,
		},{
		name: "Lee Restaurant",
		address: "33 Lee Tong St.",
		district_id: 1,
		phone: 55557121,
		coupon_type: "$23 for one standard meal",
		user_id: 1,
		},{
		name: "Ching Restaurant",
		address: "50 Tai Yuen St.",
		district_id: 2,
		phone: 55555264,
		coupon_type: "$30 for one standard meal",
		user_id: 2,
		},{
		name: "Smarten Winner Restaurant",
		address: "4 Spring Garden Lane.",
		district_id: 2,
		phone: 55553344,
		coupon_type: "$20 for one standard meal",
		user_id: 2,
		},{
		name: "Chu Restaurant",
		address: "30 Johnston Rd.",
		district_id: 2,
		phone: 55556622,
		coupon_type: "$35 for one standard meal",
		user_id: 3,
		},
		])

Event.create!([
	{
		name: "Happy Eat-a-thon",
		date: "2015-03-15",
		time: "15:00",
		district_id: 1,
		address: "33 Queens Road East, Wanchai",
		max_attendee: 50,
		current_attendee: 30,
		description: "Fun day to eat",
		user_id: 1,
		},{
		name: "Sunday Sharing Event",
		date: "2015-04-03",
		time: "15:00",
		district_id: 1,
		address: "40 Jaffe Road, Wanchai",
		max_attendee: 10,
		current_attendee: 30,
		description: "Community sharing",
		user_id: 1,
		},{
		name: "Thursday Sharing Event",
		date: "2015-04-01",
		time: "14:00",
		district_id: 2,
		address: "10 Tonnechy, Wanchai",
		max_attendee: 10,
		current_attendee: 30,
		description: "Community sharing",
		user_id: 2,
		},
		])