# -- Jessie
jessie = User.create!({
  name: 'Jessie',
  email: 'jessie@gmail.com',
  company: 'DAPP-WDI',
  username: 'messyjessie',
  password: '11111',
  oauth_token: '3084952463-3hH077jZw47mJJEpu8hxlMinILr2r1kWy5nILyd',
  oauth_secret: 'p88RDUYsRKyHjocexsVyBiZTfpr4Q6CQcAamBldnmwmc6'
})

# -- Mina
mina = User.create!({
  name: 'Mina',
  email: 'mina@gmail.com',
  company: 'DAPP-WDI',
  username: 'japaranian',
  password: '11111'
})

# -- Will
will = User.create!({
  name: 'Will',
  email: 'will@gmail.com',
  company: 'DAPP-WDI',
  username: 'sharksandwich',
  password: '11111'
})

# -- Megan
megan = User.create!({
  name: 'Megan',
  email: 'megan@gmail.com',
  company: 'DAPP-PMI',
  username: 'elcapitan',
  password: '11111'
})

# -- Carolyn
carolyn = User.create!({
  name: 'Carolyn',
  email: 'carolyn@gmail.com',
  company: 'DAPP-UX',
  username: 'carebear',
  password: '11111'
})


# -- Message 1
message1 = Message.create!({
  sender_id: 1,
  recipient_id: 2,
  subject: 'greetings',
  content: 'good morning mina!'
})

# -- Message 2
message2 = Message.create!({
  sender_id: 5,
  recipient_id: 1,
  subject: 'dolphins',
  content: "aren't they swell"
})

# -- Message 3
message3 = Message.create!({
  sender_id: 2,
  recipient_id: 3,
  subject: 'tissues',
  content: "i have a whole box, need one?"
})

# -- Message 4
message4 = Message.create!({
  sender_id: 3,
  recipient_id: 4,
  subject: 'pizza',
  content: "it's best for breakfast"
})

# -- Message 5
message5 = Message.create!({
  sender_id: 4,
  recipient_id: 5,
  subject: 'dragons',
  content: "aren't they majestic"
})