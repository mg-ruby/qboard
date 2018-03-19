require 'dry-validation'

QuestionSchema = Dry::Validation.Schema do
  required(:title).filled
  required(:body).filled
end