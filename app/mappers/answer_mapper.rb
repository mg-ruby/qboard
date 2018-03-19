class AnswerMapper < ROM::Mapper
  relation :answers

  register_as :answer

  model Answer

  attribute :question_id
  attribute :user_id
  attribute :title
  attribute :body
end