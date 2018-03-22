class QuestionRelation < ROM::Relation[:sql]
  gateway :default

  schema(:questions, infer: true) do
    associations do
      belongs_to :user
      has_many :answers
    end
  end

  def all
    select(:id, :title, :user, :user_id, :body, :created_at, :updated_at).order(:id)
  end
end