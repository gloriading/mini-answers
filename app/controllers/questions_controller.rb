class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = 'Thank you for creating a question.'
      redirect_to @question
    else
      render :new
    end

  end

  def show
    @question.update(view_count: @question.view_count + 1)
    @answers = @question.answers.order(created_at: :desc)
    @answer = Answer.new
  end

  def index
    @questions = Question.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @question.update question_params
      flash[:success] = 'Your question has been updated.'
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[success] = 'Your question has been deleted.'
      redirect_to questions_path
    else
      flash.now[:warning] = 'Delete failed.'
      render @question
    end

  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def find_question
    @question = Question.find params[:id]
  end

end
