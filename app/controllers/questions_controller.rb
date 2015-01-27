class QuestionsController < ApplicationController
  def create
    question = Question.create(question_params)
    redirect_to root_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @questionID = @question['id']
    @questionContent = @question['text']
    @questionUpvotes = @question['upvote']
    @questionDownvotes = @question['downvote']
    @answers = @question.answers.order('upvote - downvote DESC')
    @newAnswer = Answer.new
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to root_path
  end

  private
  def question_params
    params.require(:question).permit(:text, :upvote, :downvote)
  end

  def newAnswer_params
    params.require(:newAnswer).permit(:text, :upvote, :downvote, :question_id)
  end


end
