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
  
  def edit 
    @quiz = Quiz.find(params[:id])
    @question = @quiz.question
    @new_question = Question.new(:quiz_id => @quiz.id)
    @variants = @quiz.variants
    @variant = Variant.new(:quiz_id => @quiz.id)
    @variant.values.build
    @cards = @quiz.cards
  end
  
  def show
    @quiz = Quiz.find(params[:id])
    @question = @quiz.question
    @cards = @quiz.cards.order('RANDOM()').limit(2)
  end

end
