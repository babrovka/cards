# coding: utf-8

class QuizzesController < ApplicationController
  before_filter :authenticate_user!
  
  def index 
    @quizzes = Quiz.all
    @quiz = Quiz.new
  end
  
  def create
    @quiz = Quiz.create(params[:quiz])
    redirect_to quizzes_path, :notice => "Опрос создан"
  end
  
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to quizzes_path, :notice => "Опрос удален"
  end

end
