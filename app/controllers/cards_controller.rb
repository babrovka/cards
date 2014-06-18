# coding: utf-8

class CardsController < ApplicationController
  
  def destroy_all
    Card.destroy_all
    redirect_to variants_path, :notice => "Все карточки удалены"
  end

end
