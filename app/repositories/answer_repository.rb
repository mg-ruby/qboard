class AnswerRepository < ROM::Repository::Root
  root :answers

  commands :create, update: :by_pk, delete: :by_pk, mapper: :answer

  def all
    answers.all
  end

  def sorted
    answers.all.order { created_at.desc }
  end

  def by_id(id)
    answers.by_pk(id).one!
  end

  def for_question(question_id)
    answers.where(question_id: question_id)
  end

  private

  def questions
    super.map_to(Question)
  end
end