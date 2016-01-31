module ApplicationHelper
  require 'embedly'

  def embedly_preview(bookmark)
    embedly_api = Embedly::API.new(key: ENV['EMBEDLY_API_KEY'])
    obj = embedly_api.oembed(url: bookmark.url)
    image_tag(obj.first.thumbnail_url, width: '150', height: '150').html_safe
  end
end
