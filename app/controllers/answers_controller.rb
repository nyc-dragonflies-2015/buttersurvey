class AnswersController < ApplicationController

  def new
    @survey = Survey.last
    @question = Question.last

    # render :json => { :id => @survey.id }

  end

  def create
    user_input = params[:answer]
    survey_id = Question.find_by(id: params[:question_id]).survey_id
    user_input.each do |k, v|
      answer = Answer.new(body: v, question_id: params[:question_id])
      if !(answer.save && v.length >= 1)
        flash[:notice] = "problem"
        redirect_to :back
        return
      end
    end
    flash[:notice] = "submit"
    redirect_to new_survey_question_path(survey_id)
  end
end
