class SurveysController < ApplicationController
  def results
    @survey = Survey.find_by(params[:id])
    @questions = Survey.find_by(params[:id]).questions
  end

end
