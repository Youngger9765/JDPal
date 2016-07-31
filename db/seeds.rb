# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
interests = Interest.create([ { name: 'History & Culture'}, 
                              { name: 'Art & Music'}, 
                              { name: 'Nightlife'}, 
                              { name: 'Shopping'}, 
                              { name: 'Food'}, 
                              { name: 'Nature'},
                              { name: 'Business'}, 
                              { name: 'Sports'},
                              { name: 'Families'}, 
                              { name: 'Fashion & Design'},
                              { name: 'Language exchange'}, 
                              ])