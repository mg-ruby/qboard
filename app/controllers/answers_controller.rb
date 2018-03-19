class AnswersController < ApplicationController

  before_action :get_question

  def index
    @answers = repo.for_question(@question.id)
  end

  def new
    @answer = Answer.new
  end

  def create
    transaction = CreateAnswer.new
    transaction.(answer_params.merge!({ question_id: @question.id, user_id: @current_user.id })) do |result|
      result.success do |answer|
        flash[:notice] = "Answer has been created."
        redirect_to question_path(@question)
      end

      result.failure :validate do |errors|
        @answer = Answer.new(answer_params)
        @errors = errors
        flash[:alert] = "Answer could not be created."
        render :new
      end
    end
  end

  private

  def get_question
    @question = question_repo.by_id(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:title, :body).to_h.symbolize_keys
  end

  def question_repo
    QuestionRepository.new(ROM.env)
  end

  def repo
    AnswerRepository.new(ROM.env)
  end
end