require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/student.rb')
require_relative('./models/house.rb')

get '/students' do
  @students = Student.all
  erb(:index)
end

get '/students/new' do
  erb(:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

post '/students/:id/delete' do
  student = Student.find_by_id(params[:id])
  student.delete
  redirect to '/students'
end

get '/students/:id' do
  @student = Student.find_by_id(params[:id])
  erb(:show)
end