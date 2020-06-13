@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Ivan", last_name: "Sanchez")
puts "1 User Created"
100.times do |post|
    Post.create(date: Date.today, rationale: "#{post} ratioanle content", user_id: @user.id)
end

puts "100 post have been created"