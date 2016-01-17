class LikesController < ApplicationController
  def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)

     if like.save
       flash[:notice] = "Bookmark liked!"
       redirect_to [@bookmark.topic, @bookmark]
     else
       flash[:error] = "There was an error liking the bookmark. Please try again."
       redirect_to [@bookmark.topic, @bookmark]
    end
   end

   def destroy
     like = Like.find(params[:id])
     @bookmark = Bookmark.find(params[:bookmark_id])

     if like.destroy
       flash[:notice] = "Bookmark unliked!"
       redirect_to [@bookmark.topic, @bookmark]
     else
       flash[:error] = "There was an error unliking the bookmark. Please try again."
       redirect_to [@bookmark.topic, @bookmark]
     end
   end
end
