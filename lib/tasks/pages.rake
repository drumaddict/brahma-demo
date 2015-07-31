namespace :pages do
  desc "Add pages" #use as: rake pages:add[10]
  task :add, [:number_of_pages] => :environment do |t,args|
    #require 'populator'
    require 'faker'
    number_of_pages=args.number_of_pages.to_i
    puts "Creating Pages"

    puts "Populating #{number_of_pages} pages "
     number_of_pages.times do
      Page.create!({
      title: Faker::Hacker.adjective.titleize ,
      body: Faker::Lorem.paragraph(2, true, 4)
        })
      end
    end
  end