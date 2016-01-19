module ApplicationHelper
  require 'embedly'

  def embedly_preview(bookmark)
    embedly_api =
    Embedly::API.new(key: ENV['EMBEDLY_API_KEY'])
    obj = embedly_api.oembed(url: bookmark.url, thumbnail_width: 150, thumbnail_height: 150)
    image_tag(obj.first.thumbnail_url).html_safe
    # obj.first.html_safe

    # p obj
    # (obj.first.html).html_safe
  end
end
