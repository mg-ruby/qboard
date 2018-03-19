class UserMapper < ROM::Mapper
  relation :users

  register_as :user

  model User

  attribute :name
  attribute :email
end