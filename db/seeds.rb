# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

proj = ["The next biggest thing", "Terrible, terrible idea"]
hack = [true, false]
why = ["Hackthons are the future!"]
conduct = [false, true]
first = ["Travis", "Ian", "Jordan", "Nick", "Bijan"]
last = ["Tracey", "Morin", "Singer", "Woodrow", "Anjavi"]
proficiency = ["C", "C#", "C++", "D", "Java", "Ruby", "HTML"]
sponsor = ["Google", "NeXt", "Verizon", "Illuminati"]
learn = ["STOKED TO LEARN ABOUT COFFEE.", "Water is cool!"]
shirt = ["S", "M", "L", "XL"]
dietary = ["Avocado makes me die", "Peanut Butter makes me die"]
interest = ["Pie", "Problems of utmost difficulty"]

# helper method for getting a random value from array
def ss(some_array)
	some_array.shuffle.sample
end

1000.times do |i| 
	User.create(
		:email => "test"+i.to_s+"@hackarizona.org",
		:first_name => ss(first),
		:last_name => ss(last),
		:password => 'password', 
		:password_confirmation => 'password')


	Form.create(
		:user_id => User.last.id,
		:project => ss(proj),
		:first_hackathon => ss(hack),
		:why => ss(why),
 		:code_of_conduct_read => ss(conduct),
 		:proficiencies => ss(proficiency),
 		:sponsor_you_want_to_see => ss(sponsor),
 		:what_do_you_want_to_learn => ss(learn),
 		:shirt_size => ss(shirt),
 		:dietary_restriction => ss(dietary),
 		:interests => ss(interest))

end
