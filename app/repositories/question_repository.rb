class QuestionRepository < ROM::Repository::Root
  root :questions

  commands :create, update: :by_pk, delete: :by_pk, mapper: :question

  def all
    questions
  end

  def sorted
    all.combine(:user).combine(:answers).order { created_at.desc }
  end

  def by_id(id)
    questions.by_pk(id).one!
  end

  def query(search_query, user = nil)
    if search_query.present?
      SearchResults::SearchCache.add(user, search_query)
      sorted.where { title.ilike("%#{search_query}%") | body.ilike("%#{search_query}%") }
    else
      sorted
    end
  end

  def by_id_with_answers_and_users(id)
    questions.by_pk(id).combine(:user).combine(answers: :user).one!
  end

  private

  def questions
    super.map_to(Question)
  end
end