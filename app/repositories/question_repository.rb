class QuestionRepository < ROM::Repository::Root
  root :questions

  commands :create, update: :by_pk, delete: :by_pk, mapper: :question

  def all
    questions.all
  end

  def sorted
    questions.all.order { created_at.desc }
  end

  def by_id(id)
    questions.by_pk(id).one!
  end

  def query(q)
    q ? questions.where { body.ilike("%#{q}%") }.order { created_at.desc } : sorted
  end

  def by_id_with_tickets(id)
    questions.by_pk(id).combine(:tickets).one!
  end

  def by_id_with_answers_and_users(id)
    questions.by_pk(id).combine(answers: :user).one!
  end

  private

  def questions
    super.map_to(Question)
  end
end