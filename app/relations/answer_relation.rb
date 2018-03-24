class AnswerRelation < ROM::Relation[:sql]
  gateway :default

  schema(:answers, infer: true) do
    associations do
      belongs_to :user
      belongs_to :question
    end
  end
end