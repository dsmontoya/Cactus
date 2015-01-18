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
userId = [5432,231214]
conduct = [false, true]
first = ["Travis", "Ian", "Jordan", "Nick", "Bijan"]
last = ["Tracey", "Morin", "Singer", "Woodrow", "Anjavi"]

# helper method for getting a random value from array
def ss(some_array)
	some_array.shuffle.sample
end


1000.times {
	Form.create(
		:project => ss(proj),
		:first_hackathon => ss(hack),
		:why => ss(why),
		:user_id => ss(userId),
		:code_of_conduct_read => ss(conduct))
}
