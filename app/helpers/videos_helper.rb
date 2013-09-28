require 'uri'
require 'cgi'

module VideosHelper

  def thumbnail_url(video_uri)
    uri = URI(video_uri)
    if uri.host == 'www.youtube.com'
      # YouTube's thumbnail
      params = CGI::parse("#{uri.query}")
      id = params['v'].first
      "http://i.ytimg.com/vi/#{id}/default.jpg"
    else
      nil
    end
  end

end
