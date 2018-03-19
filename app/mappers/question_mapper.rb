class QuestionMapper < ROM::Mapper
  relation :questions

  register_as :question

  model Question

  attribute :title
  attribute :body
  attribute :created_at
  attribute :updated_at
end