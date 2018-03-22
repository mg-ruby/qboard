class QuestionRelation < ROM::Relation[:sql]
  gateway :default

  schema(:questions, infer: true) do
    associations do
      belongs_to :user
      has_many :answers
    end
  end

  def all
    select(:id, :title, :body, :user_id, :created_at, :updated_at).order(:id)
  end
end