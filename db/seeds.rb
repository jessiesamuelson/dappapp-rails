# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# -- Jessie
jessie = User.create!({
  name: 'Jessie',
  email: 'jessie@gmail.com',
  company: 'dapp-wdi',
  username: 'messyjessie',
  password: '11111'
})

# -- Mina
mina = User.create!({
  name: 'Mina',
  email: 'mina@gmail.com',
  company: 'dapp-wdi',
  username: 'japaranian',
  password: '11111'
})

# -- Will
will = User.create!({
  name: 'Will',
  email: 'will@gmail.com',
  company: 'dapp-wdi',
  username: 'sharksandwich',
  password: '11111'
})

# -- Megan
megan = User.create!({
  name: 'Megan',
  email: 'megan@gmail.com',
  company: 'dapp-pmi',
  username: 'elcapitan',
  password: '11111'
})

# -- Carolyn
carolyn = User.create!({
  name: 'Carolyn',
  email: 'carolyn@gmail.com',
  company: 'dapp-ux',
  username: 'carebear',
  password: '11111'
})
