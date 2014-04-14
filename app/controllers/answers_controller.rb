class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question_id)
    else
      render 'new'
    end
  end

private
  def answer_params
    params.require(:answer).permit(:response, :user_id, :question_id)
  end
end
