require 'dry-transaction'

class CreateAnswer
  include Dry::Transaction

  step :validate
  step :persist

  def validate(input)
    validation = AnswerSchema.(input)
    if validation.success?
      Success(input)
    else
      Failure(validation.errors)
    end
  end

  def persist(input)
    answer = repo.create(input)
    Success(answer)
  end

  private

  def repo
    AnswerRepository.new(ROM.env)
  end
end