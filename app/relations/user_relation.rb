class UserRelation < ROM::Relation[:sql]
  gateway :default

  schema(:users, infer: true) do
    associations do
      has_many :questions
      has_many :answers
    end
  end
end