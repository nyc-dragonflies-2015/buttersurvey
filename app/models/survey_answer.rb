class SurveyAnswer < ActiveRecord::Base
  belongs_to :survey
  belongs_to :answer
  belongs_to :user
end
