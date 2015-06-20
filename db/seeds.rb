# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


survey = Survey.create(name: "survey 1", url: "www.survey1.com")
user = User.create(name: "john", email: "john@gmail.com", password_digest: "123")
question = Question.create(body: "What's your fav scary movie?")
answer = Answer.create(body: "finding nemo")
answer2 = Answer.create(body: "cars")
answer3 = Answer.create(body: "toy story")
answer4 = Answer.create(body: "tales from the crypt")

question2 = Question.create(body: "What's your fav show?")
answer5 = Answer.create(body: "simpsons")
answer6 = Answer.create(body: "married with children")
answer7 = Answer.create(body: "king of the hill")
answer8 = Answer.create(body: "clarissa explains it all")



survey.questions << question
question.answers << answer
question.answers << answer2
question.answers << answer3
question.answers << answer4


survey.questions << question2
question2.answers << answer5
question2.answers << answer6
question2.answers << answer7
question2.answers << answer8

user.surveys << survey
survey_answer = SurveyAnswer.create(survey_id: 1, answer_id: 1, user_id: 1)
survey_answer2 = SurveyAnswer.create(survey_id: 1, answer_id: 2, user_id: 1)
survey_answer3 = SurveyAnswer.create(survey_id: 1, answer_id: 4, user_id: 1)
survey_answer4 = SurveyAnswer.create(survey_id: 1, answer_id: 6, user_id: 1)
survey_answer5 = SurveyAnswer.create(survey_id: 1, answer_id: 7, user_id: 1)


