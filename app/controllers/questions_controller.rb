class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
   @question = Question.new(question_params)
   if @question.save
     flash[:notice] = "Question asked"
     redirect_to '/'
   else
     flash[:error] = @question.errors.full_messages.join(". ")
     render :new
   end
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id]).destroy
    flash[:notice] = "Question deleted"
      redirect_to '/questions'
  end

  protected
  def question_params
    params.require(:question).permit(:title, :body)
  end

end
