class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!

  def create

    puts "INCOMING PARAMS HERE: #{params}"
    @user = User.find_by(email: params["sender"])
    @topic = Topic.find_by(title: params["subject"])
    @url = params[:"stripped-text"]
    puts @url

    if @user.nil?
      @user = User.new(email: params["sender"], password: "hell0_w0rld")
      @user.skip_confirmation!
      @user.save
    end

    if @topic.nil?
      @topic = @user.topics.create(title: params["subject"])
      @topic.save!
    end

    @bookmark = @topic.bookmarks.build(url: @url)
    @bookmark.save!


    head 200
  end
end
