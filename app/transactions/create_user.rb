require 'dry-transaction'

class CreateUser
  include Dry::Transaction

  step :validate
  step :persist

  def validate(input)
    validation = UserSchema.(input)
    if validation.success?
      Success(input)
    else
      Failure(validation.errors)
    end
  end

  def persist(input)
    user = repo.create(input)
    Success(user)
  end

  private

  def repo
    UserRepository.new(ROM.env)
  end
end