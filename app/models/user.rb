class User < ApplicationModel
  attribute :name, Types::Strict::String
  attribute :email, Types::Strict::String
  attribute :password, Types::Strict::String
  attribute :questions, Types::Strict::Array.of(Question).default([])
  attribute :answers, Types::Strict::Array.of(Answer).default([])
  attribute :created_at, Types::Time
  attribute :updated_at, Types::Time
end