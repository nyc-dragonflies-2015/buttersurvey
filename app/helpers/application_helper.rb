module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def answer_count(answer)
    answer.survey_answers.count
  end
end
