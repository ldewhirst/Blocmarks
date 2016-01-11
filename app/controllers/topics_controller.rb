class TopicsController < ApplicationController
  before_action :require_sign_in, except: [:index]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    if user_not_sign_in?
      flash.now[:alert] = "You must be signed in to view this topic"
      redirect_to new_session_path
    end
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:notice] = "Topic was saved."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error saving the topic. Please try again."
      render :new
    end

  def edit
    @topic = Topic.find(params[:id])
  end

  def Update
    @topic = Topic.find(params[:id])

    @topic.assign_attributes(topic_params)
end

private

  def topic_params
    params.require(:topic).permit(:title)
