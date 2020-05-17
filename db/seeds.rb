User.create!(name: Faker::Games::Pokemon.name,
  email: "aa@aa.aa",
  password: "aaaaaa",
  password_confirmation: "aaaaaa",
  )

99.times do |n|
  password = "password"
  User.create!(name: Faker::Games::Pokemon.name,
               email: Faker::Internet.email,
               password: password,
               password_confirmation: password,
               )
end

Verb.create!(user_id: 1,
            name: "学習中",
            selected: true,
            important: true
              )

Verb.create!(user_id: 1,
  name: "休憩中",
  selected: true,
  important: false
    )
Verb.create!(user_id: 1,
  name: "その他の行動",
  selected: true,
  important: false
    )


27.times do |n|
  Verb.create!(user_id: 1,
              name: Faker::Games::Pokemon.move,
              selected: false,
              important: false
               )
end