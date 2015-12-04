User.create(name:  "Sujoy Datta",
             email: "sujoy@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             admin: true)

User.create(name:  "Muhammad Tamzid",
             email: "muhammad.tamzid@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             admin: true)

User.create(name:   "Sirajus Salekin",
             email: "sjsalekin@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             admin: true)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "12345678"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

Category.create(name:  "Git")
Category.create(name:  "Git2")
Category.create(name:  "Git3")
Category.create(name:  "Git4")

Word.create(category_id: 1, content: "w1")
Word.create(category_id: 1, content: "w2")
Word.create(category_id: 2, content: "w3")
Word.create(category_id: 2, content: "w4")
Word.create(category_id: 1, content: "w5")

WordAnswer.create(word_id: 1, content: "o1", correct: false)
WordAnswer.create(word_id: 1, content: "o2", correct: true)
WordAnswer.create(word_id: 1, content: "o3", correct: false)
WordAnswer.create(word_id: 1, content: "o4", correct: false)
WordAnswer.create(word_id: 2, content: "o5", correct: false)
WordAnswer.create(word_id: 2, content: "o6", correct: false)
WordAnswer.create(word_id: 2, content: "o7", correct: false)
WordAnswer.create(word_id: 2, content: "o8", correct: true)
WordAnswer.create(word_id: 3, content: "o9", correct: true)
WordAnswer.create(word_id: 3, content: "o10", correct: false)
WordAnswer.create(word_id: 3, content: "o11", correct: false)

Lesson.create(user_id: 4, category_id: 1, lesson_result: 8)
Lesson.create(user_id: 4, category_id: 2, lesson_result: 5)
Lesson.create(user_id: 4, category_id: 1, lesson_result: 7)

LessonWord.create(lesson_id: 1, word_id: 1, word_answer_id: 2)
LessonWord.create(lesson_id: 1, word_id: 2, word_answer_id: 4)
LessonWord.create(lesson_id: 1, word_id: 3, word_answer_id: 2)
