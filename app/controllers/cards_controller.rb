# coding: utf-8

class CardsController < ApplicationController
  
  def index
    @quiz = Quiz.find(params[:id])
    @cards = Card.where(:quiz_id => @quiz.id).order('rating DESC')
    @variants = @quiz.variants
    
    respond_to do |format|
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end
  
  def destroy_all
    cards = Card.where(:quiz_id => params[:id])
    cards.destroy_all
    redirect_to :back, :notice => "Все карточки удалены"
  end
  
  def conjoint
    @cards = Card.order('RANDOM()').limit(2)
  end
  
  def select
    @card = Card.find(params[:id])
    @card.rating += 1
    @card.save!
    redirect_to :back, :notice => "Выбор сделан"
  end

end
