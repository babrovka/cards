# coding: utf-8

class QuestionsController < ApplicationController
  
  def create
    @question = Question.create(params[:question])
    redirect_to :back, :notice => "Вопрос создан создан"
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to :back, :notice => "Вопрос удален"
  end


end
