# coding: utf-8

class CardsController < ApplicationController
  
  def destroy_all
    Card.destroy_all
    redirect_to variants_path, :notice => "Все карточки удалены"
  end
  
  def conjoint
    @cards = Card.order('RANDOM()').limit(2)
  end

end
