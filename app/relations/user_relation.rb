class UserRelation < ROM::Relation[:sql]
  gateway :default

  schema(:users, infer: true) do
    associations do
      has_many :questions
      has_many :answers
    end
  end

  def user_questions
    assoc(:questions)
  end
  
  def user_answers
    assoc(:answers)
  end
end