namespace :populate do
  desc "Erase and fill database" #use as: rake populate things_and_types[10,5]
  task :things_and_types, [:number_of_types,:number_of_things_per_type] => :environment do |t,args|
    #require 'populator'
    require 'faker'
    number_of_types=args.number_of_types.to_i
    number_of_things_per_type=args.number_of_things_per_type.to_i
    puts "Erasing all types and things."
    Type.delete_all
    puts "Populating #{number_of_types} types with  #{number_of_things_per_type} things each. "
     number_of_types.times do
      Type.create!({
      title: Faker::Hacker.adjective.titleize ,
      description: Faker::Hacker.say_something_smart
        })
      end
      types=Type.all
      types.each do  |type|
          number_of_things_per_type.times do
          type.things.create!({
            title: Faker::Hacker.adjective.titleize,
            description: Faker::Hacker.say_something_smart ,
            published: [true, false].sample,
            featured: [true, false].sample
            })
        end
      end
    end
  end