require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house_id, :age

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id']
    @age = options['age'].to_i
  end

  def save
    sql = "INSERT INTO students (first_name, last_name, house_id, age) VALUES ('#{@first_name}', '#{@last_name}', '#{@house_id}', #{@age}) RETURNING *;"
    student = SqlRunner.run(sql).first
    @id = student['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM students where id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM students"
    return self.get_many(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = #{id}"
    student_hash = SqlRunner.run(sql).first
    result = Student.new(student_hash)
    return result
  end

  def self.get_many(sql)
    students = SqlRunner.run(sql)
    result = students.map {|student| Student.new(student)}
    return result  
  end

  def house
    sql = "SELECT * FROM houses WHERE id = #{@house_id};"
    house = SqlRunner.run(sql).first
    return House.new(house)
  end

end