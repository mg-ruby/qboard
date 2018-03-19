require 'dry-validation'

AnswerSchema = Dry::Validation.Schema do
  required(:title).filled
  required(:body).filled
end