require_relative('../models/student.rb')
require('pry')

Student.delete_all

student1 = Student.new({
  "first_name" => "Alice",
  "last_name" => "Loudon",
  "house" => "Hufflepuff",
  "age" => 25
  })

student2 = Student.new({
  "first_name" => "Ross",
  "last_name" => "Crichton",
  "house" => "Ravenclaw",
  "age" => 29
  })


student1.save
student2.save

binding.pry
nil
