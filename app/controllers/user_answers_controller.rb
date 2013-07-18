class UserAnswersController < ApplicationController
  # GET /user_answers
  # GET /user_answers.json
  def index
    @user_answers = current_user.user_answers
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_answers }
    end
  end

  # POST /user_answers
  # POST /user_answers.json
  def create
    @user_answer = UserAnswer.new(params[:user_answer])
    respond_to do |format|
      if @user_answer.save
        format.html { redirect_to games_pickquestion_path, notice: 'User answer was successfully created.' }
        format.json { render json: @user_answer, status: :created, location: games_pickquestion_path }
      else
        format.html { render action: "new" }
        format.json { render json: @user_answer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def clear
    UserAnswer.where(:user_id => current_user.id).destroy_all
    redirect_to games_pickquestion_path
  end

end
