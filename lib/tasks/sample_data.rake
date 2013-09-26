namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@example.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    users.first.videos.create!(url: "Url", title: "Title", description: "Description")

    50.times do
      url = "http://youtube.com"
      title = Faker::Lorem.sentence(1)
      description = Faker::Lorem.sentence(5)
      users.each do |user|
        user.videos.create!(url: url, title: title, description: description)
      end
    end
  end
end
