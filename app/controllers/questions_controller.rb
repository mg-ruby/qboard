class QuestionsController < ApplicationController
  def index
    @questions = repo.query(params[:q])
  end

  def show
    @question = repo.by_id_with_answers_and_users(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    transaction = CreateQuestion.new
    transaction.(question_params) do |result|
      result.success do |question|
        flash[:notice] = "Question has been created."
        redirect_to questions_path
      end

      result.failure :validate do |errors|
        @question = Question.new(question_params)
        @errors = errors
        flash[:alert] = "Question could not be created."
        render :new
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :q).to_h.symbolize_keys
  end

  def repo
    QuestionRepository.new(ROM.env)
  end
end