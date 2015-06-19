class Survey < ActiveRecord::Base
  has_many :questions
  has_many :survey_answers
  belongs_to :creator, class_name: "User"
end
