class Question < ApplicationModel
  attribute :title, Types::Strict::String
  attribute :body, Types::Strict::String
  attribute :answers, Types::Strict::Array.of(Answer).default([])
  attribute :created_at, Types::Time
  attribute :updated_at, Types::Time
end