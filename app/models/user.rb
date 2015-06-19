class User < ActiveRecord::Base
  has_many :surveys, foreign_key: "creator_id"
  has_many :survey_answers
  has_many :questions, through: :surveys
  has_many :surveys, through: :survey_answers
end
