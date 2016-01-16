class BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new(params[:id])
    @users = User.all

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
    @bookmark.url = params[:bookmark][:url]
    @bookmark.user_id = current_user.id

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = "There was an error saving the bookmark. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @users = User.all
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "There was an error saving the bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to topic_path(@bookmark.topic)
    else
      flash.now[:alert] = "There was an error deleting the bookmark. Please try again."
      render :show
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
