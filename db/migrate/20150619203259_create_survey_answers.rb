class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.references :survey
      t.references :answer
      t.references :user

      t.timestamps null: false
    end
  end
end
