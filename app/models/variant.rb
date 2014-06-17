# coding: utf-8

class Variant < ActiveRecord::Base
  attr_accessible :title, :values_attributes
  has_many :values, dependent: :destroy
  accepts_nested_attributes_for :values, allow_destroy: true
  after_create :recreate_cards
  after_destroy :recreate_cards
  
  
  def recreate_cards
    Card.destroy_all
    qty = Variant.count * Value.count
    qty.times do
      Card.create
    end
    
    Variant.all.each do |variant|
      variant.values.each do |value|
         Card.all.each do |card|
           card.properties[variant.title] = value.title if card.properties[variant.title] != variant.title
           card.save
         end
      end
    end
    
    
  end
end
