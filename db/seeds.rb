# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create(name: 'Designing for Customer Growth', starts_at: Date.today, ends_at: Date.tomorrow, venue: 'Inspire9', description: 'Its gonna be super duper awesome fun times! YAY!')
