# coding: utf-8

class VariantsController < ApplicationController
  
  def index
    @variants = Variant.all
    @variant = Variant.new
  end
  
  def create 
    @variant = Variant.create(params[:variant])
    redirect_to variants_path, :notice => "Параметр создан"
  end

end
