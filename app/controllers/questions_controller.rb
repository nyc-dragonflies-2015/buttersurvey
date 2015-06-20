class QuestionsController < ApplicationController
  def new
    @survey = Survey.find_by(id: params[:survey_id])
    @question = Question.new
  end
end
