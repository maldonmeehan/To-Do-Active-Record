require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/task')
require('./lib/list')
require('pg')

DB = PG.connect({:dbname => "to_do"})

get('/') do
  erb(:index)
end

get("/lists/new") do
  erb(:lists_form)
end

post("/lists") do
  name = params.fetch("list_name")
  @list = List.new({:name => name, :id => nil})
  @list.save()
  erb(:list_success)
end

get("/lists") do
  @lists = List.all()
  erb(:lists)
end

get("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  erb(:list)
end

get('/tasks') do
  @tasks = Task.all()
  @list = List.find(params.fetch('id').to_i())
  erb(:tasks)
end ##

post("/tasks") do
  description = params.fetch("description")
  list_id = params.fetch("list_id").to_i()
  @list = List.find(list_id)
  @task = Task.new({:description => description, :list_id => list_id})
  @task.save()
  erb(:list_success)
end
