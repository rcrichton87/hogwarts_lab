require_relative('../db/sql_runner.rb')

class House

  attr_reader :id
  attr_accessor :name, :logo

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save
    sql = "INSERT INTO houses (name, logo) VALUES ('#{@name}', '#{@logo}') RETURNING *;"
    house = SqlRunner.run(sql).first
    @id = house['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM houses where id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM houses"
    return self.get_many(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = #{id}"
    house_hash = SqlRunner.run(sql).first
    result = House.new(house_hash)
    return result
  end

  def self.get_many(sql)
    houses = SqlRunner.run(sql)
    result = houses.map {|house| House.new(house)}
    return result  
  end

end