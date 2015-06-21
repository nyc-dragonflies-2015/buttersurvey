class QuestionsController < ApplicationController
  def new
    @survey = Survey.find_by(id: params[:survey_id])
    @question = Question.new
  end

  def create
    @question = Question.new(body: params[:question][:body], survey_id: params[:survey_id])
    if @question.save

      render :json => { :id => @question.id }

    else
      flash[:notice] = "you must enter a body"
      redirect_to new_survey_question_path(params[:survey_id])
    end
  end
end
