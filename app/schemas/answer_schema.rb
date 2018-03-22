require 'dry-validation'

AnswerSchema = Dry::Validation.Schema do
  required(:body).filled
end