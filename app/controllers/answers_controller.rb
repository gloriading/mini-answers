class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question
  before_action :find_answer, only: [:destroy]

  def create
    @answer = Answer.new answer_params
    @answer.question = @question
    if @answer.save
      redirect_to @question
    else
      @answers = @question.answers.order(created_at: :desc)
      render 'questions/show'
    end
  end

  def destroy
    @answer.destroy
    redirect_to @question
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_question
    @question = Question.find params[:question_id]
  end

  def find_answer
    @answer = Answer.find params[:id]
  end
end
