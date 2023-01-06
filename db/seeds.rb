
Doorkeeper::Application.find_or_create_by(name: "Simple Chat Client", redirect_uri: 'http://127.0.0.1/',
                                          uid: 'simple_chat_client', scopes: 'user')

#default_user
users = ['jessica', 'Thomas', 'Karen']

users.each do |user|
  User.create(
    email: "#{user.downcase}@mailinator.com",
    password: 'Pass123!',
    name: user
  )
end
