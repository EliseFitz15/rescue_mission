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

  def update
    @answers = Answer.where(question_id: params[:question_id])
    @answers.each do |a|
      if a.id == params[:id].to_i
        a.best = true
        a.update(id: params[:id])
        flash[:notice] = "Best answer set"
      else
        a.best = false
        a.update(id: a.id)
      end
    end
    binding.pry
    redirect_to question_path(params[:question_id])
  end

  protected
  def answer_params
    params.require(:answer).permit(:body, :question_id, :best)
  end
end
