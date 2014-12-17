class Comment < ActiveRecord::Base
 belongs_to :article

 def after_create
  puts "send an email....."
 end
end
