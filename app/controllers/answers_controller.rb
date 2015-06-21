class AnswersController < ApplicationController

  def new
  end

  def create
    user_input = params[:answer]
    user_input.each do |k, v|
      answer = Answer.new(body: v, question_id: params[:question_id])
      if !(answer.save && v.length >= 1)
        flash[:notice] = "problem"
        redirect_to
        return
      end
    end
    flash[:notice] = "saved"
    redirect_to :back
  end
end
