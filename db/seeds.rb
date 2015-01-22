# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'system', password: '123456', email: 'system@example.com')
User.create(username: 'admin', password: '123456', email: 'admin@example.com')
User.create(username: 'tester', password: '123456', email: 'test@example.com')
Role.create(name: 'system')
Role.create(name: 'admin')
Role.create(name: 'guest')