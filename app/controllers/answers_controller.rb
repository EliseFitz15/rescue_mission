class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question

    if @answer.save
      flash[:notice] = 'Answer submitted'
      redirect_to question_path(params[:question_id])
    else
      flash[:notice] = 'Answer too short'
      redirect_to question_path(params[:question_id])
    end
  end

  protected
  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
