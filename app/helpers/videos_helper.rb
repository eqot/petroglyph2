require 'uri'
require 'cgi'

module VideosHelper

  def get_thumbnail(video)
    uri = URI(video.url)
    if uri.host == 'www.youtube.com'
      # YouTube's thumbnail
      params = CGI::parse("#{uri.query}")
      id = params['v'].first
      "http://i.ytimg.com/vi/#{id}/default.jpg"
    else
      nil
    end
  end

  def get_title(video)
    if video && video.title.length > 0
      video.title
    else
      "(no title)"
    end
  end

end
