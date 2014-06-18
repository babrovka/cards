# coding: utf-8

class Variant < ActiveRecord::Base
  attr_accessible :title, :values_attributes, :combinations
  attr_accessor :combinations
  has_many :values, dependent: :destroy
  accepts_nested_attributes_for :values, allow_destroy: true
  after_create :recreate_cards
  after_destroy :recreate_cards
  
  
  def recreate_cards
    
    
    
    Card.destroy_all
    qty = 1
    Variant.all.each do |v|
      values = v.values.count
      qty *= values
    end
    cards = []
    qty.times do
      c = Card.create
      cards << c
    end
    
    val_lengths = Variant.all.map{|v| v.values.length }
    counts = Hash.new 0
    val_lengths.each {|x| counts[x] += 1}
    Variant.all.each do |variant|
      values = variant.values.pluck(:title)
      n = 0
      for i in (0..qty-1)
      card = cards[i]
      if counts[values.length] > 1 && i.even?
        last_value = values.last
        values.pop
        values.unshift(last_value)
        val_lengths.delete(values.length)
      end
      puts i
      card.properties[variant.title] = values[n]
      card.save!
      n += 1
      if n > values.length - 1
        n = 0
      end
    end
    end
    

    
    
  end
end
