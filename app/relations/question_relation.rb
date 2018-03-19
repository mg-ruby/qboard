class QuestionRelation < ROM::Relation[:sql]
  gateway :default

  schema(:questions, infer: true) do
    associations do
      has_many :answers
    end
  end

  def all
    select(:id, :title, :body, :created_at, :updated_at).order(:id)
  end
end