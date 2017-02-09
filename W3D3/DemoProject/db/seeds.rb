# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.new(name: "Leia", house_id: 1).save
Person.new(name: "Bail", house_id: 1).save
Person.new(name: "Luke", house_id: 2).save
Person.new(name: "Owen", house_id: 2).save
Person.new(name: "Beru", house_id: 2).save
House.new(address: "Astroid Belt (previously known as Alderaan)").save
House.new(address: "Moisture Farm #3, Tatooine").save
