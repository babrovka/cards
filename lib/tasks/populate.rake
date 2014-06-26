# coding: utf-8
require 'csv'
require 'faker'

namespace :create do
  desc "Create DB data"
  
  task :properties => :environment do
    Property.destroy_all
    Value.destroy_all
    Property.populate 10 do |p|
      p.title = Populator.words(1.2)
    end
    
    Property.all.each do |p|
      v = Value.new(:title => '100')
      v.save!
      p.values << v
      v = Value.new(:title => '200')
      v.save!
      p.values << v
      v = Value.new(:title => '300')
      v.save!
      p.values << v
    end
    
    puts "Properties created!"
  end
  
  task :cards => :environment do
    Card.destroy_all
    Card.populate 100 do |p|
      p.text = Populator.sentences(1..10)
    end
    Card.all.each do |c|
      c.properties << Property.all
      c.save!
    end
    puts "Cards created!"
  end
  
  task :users => :environment do
    User.destroy_all
    User.create(:email => 'babrovka@gmail.com', :password => 'babrovka', :password_confirmation => 'babrovka')
    User.create(:email => 'salkutsan@kafedrapik.ru', :password => 'salkutsan', :password_confirmation => 'salkutsan')
    puts "Users created!"
  end
  
  task :quiz => :environment do
    quiz = Quiz.create(:title => 'Кафедра')
    Card.all.each do |card|
      card.quiz_id = quiz.id
      card.save!
    end
    Variant.all.each do |variant|
      variant.quiz_id = quiz.id
      variant.save!
    end
  end
  
end

