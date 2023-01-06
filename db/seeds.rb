
Doorkeeper::Application.find_or_create_by(name: "Simple Chat Client", redirect_uri: 'http://127.0.0.1/',
                                          uid: 'simple_chat_client', scopes: 'user')

# create default user
users = ['Jessica', 'Thomas', 'Karen', 'Shawn', 'Tyler', 'Emily']
phone_numbers = ['081221111', '089221122', '081221122', '081221322', '083221388', '081221399']

users.each_with_index do |user, index|
  email = "#{user.downcase}@mailinator.com"

  next if User.find_by_email(email)

  User.create(
    email: email,
    password: 'Pass123!',
    phone_number: phone_numbers[index],
    name: user
  )
end

# add contacts to first user
User.first.contacts.create(name: 'Friend Shawn', phone_number: '081221322')
User.first.contacts.create(name: 'My Crush', phone_number: '083221388')
User.first.contacts.create(name: 'Big Brother Thomas', phone_number: '089221122')

# add contacts to second user
User.second.contacts.create(name: 'Little Sister Jessica', phone_number: '081221111')
User.second.contacts.create(name: 'My Wife', phone_number: '081221122')

# add contacts to third user
User.third.contacts.create(name: 'Hubby', phone_number: '089221122')