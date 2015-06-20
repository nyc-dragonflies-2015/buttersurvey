class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness:true
  validates :password, presence: true
  has_many :surveys, foreign_key: :creator_id
  has_many :survey_answers
  has_many :questions, through: :surveys

end
