require 'dry-transaction'

class CreateQuestion
  include Dry::Transaction

  step :validate
  step :persist

  def validate(input)
    validation = QuestionSchema.(input)
    if validation.success?
      Success(input)
    else
      Failure(validation.errors)
    end
  end

  def persist(input)
    question = repo.create(input)
    Success(question)
  end

  private

  def repo
    QuestionRepository.new(ROM.env)
  end
end