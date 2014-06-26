# coding: utf-8

class VariantsController < ApplicationController
  before_filter :authenticate_user!
  
  # def index
  #   @variants = Variant.all
  #   @variant = Variant.new
  #   @variant.values.build
  #   @cards = Card.all
  #   @question = Question.new
  # end

  def create 
    @variant = Variant.create(params[:variant])
    redirect_to :back, :notice => "Параметр создан"
  end
  
  def destroy
    @variant = Variant.find(params[:id])
    @variant.destroy
    redirect_to :back, :notice => "Параметр удален"
  end

end
