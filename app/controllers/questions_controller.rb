class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id]).destroy
    flash[:notice] = "Question deleted"
      redirect_to '/questions'
  end
end
