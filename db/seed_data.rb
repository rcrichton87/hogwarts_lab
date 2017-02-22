require_relative('../models/student.rb')

Student.delete_all

student1 = Student.new({
  "first_name" => "Alice",
  "last_name" => "Loudon",
  "house" => "Hufflepuff",
  "age" => 25
  })

student1.save