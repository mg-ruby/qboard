class UserRepository < ROM::Repository::Root
  root :users

  commands :create, update: :by_pk, delete: :by_pk, mapper: :user

  def by_id(id)
    users.by_pk(id).one!
  end

  def from_omniauth(auth_params)
    data = auth_params.info
    puts data
    user = users.where(email: data['email']).first

    unless user
      user_params = { name: data[:name], email: data[:email], password: PasswordGenerator.random_password } 
      user = CreateUser.new.call(user_params)      
    end
    user
  end

end