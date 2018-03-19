class Answer < ApplicationModel
  attribute :title, Types::Strict::String
  attribute :body, Types::Strict::String
  attribute :question_id, Types::Strict::Int
  attribute :user_id, Types::Strict::Int
  attribute :user, Types::Constructor(User)
  attribute :created_at, Types::Time
  attribute :updated_at, Types::Time
end