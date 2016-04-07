# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# cording: utf-8
User.create(:username => 'dummy1', :email => 'dummy1@example.com', :password => 'password')
User.create(:username => 'dummy2', :email => 'dummy2@example.com', :password => 'password')
User.create(:username => 'dummy3', :email => 'dummy3@example.com', :password => 'password')
