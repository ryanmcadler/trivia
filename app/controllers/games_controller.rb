class GamesController < ApplicationController

  before_filter :authorize

  def pickquestion
    @user_answers = current_user.user_answers
    if @user_answers.any?
      @question = Question.where("id NOT IN (?)", @user_answers.collect(&:question_id)).first(:order => "RANDOM()")
    else
      @question = Question.first(:order => "RANDOM()")
    end
    if @question
      @user_answer = UserAnswer.new
    else
      redirect_to user_answers_path
    end
  end
  
end
