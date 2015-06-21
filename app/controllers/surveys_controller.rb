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
    secret_url = SecureRandom.hex(4)
    @survey = Survey.new(name: params[:survey][:name], creator_id: session[:user_id], url: secret_url)
    if @survey.save
      redirect_to new_survey_question_path(@survey.id)
    else
      flash[:notice] = "you must enter a title"
      redirect_to :back
    end
  end

  def show
    @survey = Survey.find_by(id: params[:id])
    @questions = @survey.questions
  end

end
