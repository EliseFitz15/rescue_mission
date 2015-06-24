class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question

    if @answer.save!
      flash[:notice] = 'Answer submitted'
      redirect_to question_answers_path(params[:question_id])
    else
      render :index
    end
  end

  protected
  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
