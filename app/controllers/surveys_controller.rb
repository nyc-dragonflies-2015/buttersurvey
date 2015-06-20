class SurveysController < ApplicationController

  def results
    @survey = Survey.find_by(params[:id])
    @questions = Survey.find_by(params[:id]).questions
  end

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(params[:survey][:name])
  end
end
