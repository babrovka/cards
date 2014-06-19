# coding: utf-8

class CardsController < ApplicationController
  
  def index
    @cards = Card.order(:rating)
    respond_to do |format|
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end
  
  def destroy_all
    Card.destroy_all
    redirect_to variants_path, :notice => "Все карточки удалены"
  end
  
  def conjoint
    @cards = Card.order('RANDOM()').limit(2)
  end
  
  def select
    @card = Card.find(params[:id])
    @card.rating += 1
    @card.save!
    redirect_to conjoint_path, :notice => "Выбор сделан"
  end

end
