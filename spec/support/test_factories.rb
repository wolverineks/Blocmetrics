module TestFactories

include Warden::Test::Helpers
Warden.test_mode!

  def associated_registered_application(options={})
    registered_application_options = {
      name: 'application name',
      url: 'www.example.com'
      user: authenticated_user
    }.merge(options)

    RegisteredApplication.create(registered_application_options)
  end

  def authenticated_user(options={})
    user_options = {
      email: "email#{rand}@fake.com", 
      password: "helloworld"
    }.merge(options)

    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end

end