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
