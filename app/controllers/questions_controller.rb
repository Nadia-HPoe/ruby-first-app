class QuestionsController < ApplicationController
  before_action :load_question, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user, except: [ :create ]
  
  def edit
  end

  def show
  # Можно отрендерить шаблон или редиректить
  end

  def create
  #   Rails.logger.debug "Received params[:question]: #{params[:question].inspect}"
  #   Rails.logger.debug "Current user id: #{current_user.id}"
  #   Rails.logger.debug "Target user id from params: #{params[:question][:user_id]}"

  #   @question = current_user.questions.build(question_params.except(:user_id))
  #   @question.user_id = params[:question][:user_id] # Если нужно установить, кому адресован вопрос
  #     if @question.save
  # redirect_to user_path(@question.user), notice: "Question was successfully created."
  #     else
  # Rails.logger.debug "Errors: #{@question.errors.full_messages}"
  # # Можно отрендерить страницу с формой, на которой будете видеть ошибки
  # # Если страницы :new нет, то лучше редиректить обратно куда нужно
  # render :new
  #     end
    @question = Question.new(question_params)
      if @question.save
        redirect_to user_path(@question.user), notice: "Question was successfully created." 
      else
        render :new, status: :unprocessable_entity
      end
  end


  def update
      if @question.update(question_params)
        redirect_to user_path(@question.user), notice: "Question was successfully updated."
      else
        render :edit
      end
  end

  def destroy
    user = @question.user
    @question.destroy
    redirect_to user_path(user), notice: "Question was successfully destroyed."
  end

  private
    def load_question
      @question = Question.find(params[:id])
    end

    def authorize_user
      reject_user unless @question.user == current_user
    end

    def question_params
      if current_user.present? && params[:question][:user_id].to_i == current_user.id
        params.require(:question).permit(:user_id, :text, :answer)
      else
        params.require(:question).permit(:user_id, :text)
      end
    end 
end
