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
  def edit
    @question = Question.find(params[:id])
  end
  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:notice] = "Question is updated, i love you."
      redirect_to question_path
    else
      flash[:error] = @question.errors.full_messages.join(". ")
      render :edit
    end
  end
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.where(question_id: params[:id]).order(:best)
  end

  def destroy
    @question = Question.find(params[:id]).destroy
    flash[:notice] = "Question deleted"
      redirect_to '/questions'
  end

  protected
  def question_params
    params.require(:question).permit(:title, :body, :question_id)
  end

end
