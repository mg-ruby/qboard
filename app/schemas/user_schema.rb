require 'dry-validation'

UserSchema = Dry::Validation.Schema do
  required(:name).filled
  required(:email).filled
  required(:password).filled
end