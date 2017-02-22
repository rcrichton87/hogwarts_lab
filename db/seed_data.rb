require_relative('../models/student.rb')
require_relative('../models/house.rb')
require('pry')

Student.delete_all
House.delete_all

house1 = House.new({
  "name" => "Gryffindor",
  "logo" => "http://vignette2.wikia.nocookie.net/harrypotter/images/e/ee/Gryffindor_Crest-0.jpg/revision/latest?cb=20160729145529"
  })

house2 = House.new({
  "name" => "Slytherin",
  "logo" => "http://vignette1.wikia.nocookie.net/harrypotter/images/7/72/Ccd53034-c798-452a-8032-f28e06250d8f.jpg/revision/latest/scale-to-width-down/160?cb=20160729150848"
  })

house3 = House.new({
  "name" => "Hufflepuff",
  "logo" => "http://vignette1.wikia.nocookie.net/harrypotter/images/6/62/Download_(9).jpg/revision/latest?cb=20160729145653"
  })

house4 = House.new({
  "name" => "Ravenclaw",
  "logo" => "http://vignette4.wikia.nocookie.net/harrypotter/images/2/28/Download_(4).jpg/revision/latest?cb=20160729145945"
  })

house1.save
house2.save
house3.save
house4.save

student1 = Student.new({
  "first_name" => "Alice",
  "last_name" => "Loudon",
  "house_id" => "#{house3.id}",
  "age" => 25
  })

student2 = Student.new({
  "first_name" => "Ross",
  "last_name" => "Crichton",
  "house_id" => "#{house4.id}",
  "age" => 29
  })

student1.save
student2.save

binding.pry
nil
