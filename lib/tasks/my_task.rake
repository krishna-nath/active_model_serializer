require 'rake'

task :my_task => :environment do
  users = User.all

  users.each do |user|
        puts(user)
  end
end