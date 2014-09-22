# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create({:email => 'test@test.com' , :password => '123' })

Category.create([{:name => "Science"},{:name => "Politics"},{:name => "ShowBiz"},{:name => "IT" },{:name => "Travel"}, {:name => "General"}])
Category.all.each do |c|
  c.articles.create({:title => "Test article for #{c.name}", :body => %Q{ #{" this is a test article for #{c.name}... \n"*10}  } })
end
Article.all.each do |a|
  a.comments.create({:name => "test comment on '#{a.title}'", :email => "test@test.com", :body => %Q{#{"comment on #{a.title}... \n"*3}}})
end