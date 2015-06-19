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


survey.questions << question
question.answers << answer
question.answers << answer2
question.answers << answer3
question.answers << answer4
user.surveys << survey
