# coding: utf-8

class VariantsController < ApplicationController
  
  def index
    @variants = Variant.all
    @variant = Variant.new
    @variant.values.build
    @cards = Card.all
  end
  
  def create 
    @variant = Variant.create(params[:variant])
    redirect_to variants_path, :notice => "Параметр создан"
  end
  
  def destroy
    @variant = Variant.find(params[:id])
    @variant.destroy
    redirect_to variants_path, :notice => "Параметр удален"
  end

end
