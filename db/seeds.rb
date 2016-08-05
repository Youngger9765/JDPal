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

languages = Language.create([ { name: 'Mandarin', chinese_name: '中文'}, 
                              { name: 'English', chinese_name: '英文'},
                              { name: 'Japanese', chinese_name: '日文'},
                              { name: 'Cantonese', chinese_name: '廣東話'},
                              { name: 'Taiwanese', chinese_name: '台語'},
                              { name: 'Korean', chinese_name: '韓語'},
                              { name: 'Spanish', chinese_name: '西班牙文'},
                              { name: 'French', chinese_name: '法文'},
                              { name: 'German', chinese_name: '德文'},
                              { name: 'others', chinese_name: '其他'},
                              ])