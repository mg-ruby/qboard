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

  def query(search_query, user = nil)
    if search_query.present?
      SearchResults::SearchCache.add(user, search_query)
      questions.where { body.ilike("%#{search_query}%") }.order { created_at.desc }
    else
      sorted.combine(:user)
    end
  end

  def by_id_with_answers_and_users(id)
    questions.by_pk(id).combine(answers: :user).one!
  end

  private

  def questions
    super.map_to(Question)
  end
end