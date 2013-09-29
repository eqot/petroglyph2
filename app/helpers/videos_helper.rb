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

  def get_player(video)
    videoId = get_id(video)
    "http://www.youtube.com/embed/" + videoId + "?enablejsapi=1"
  end

  private

    def get_id(video)
      uri = URI(video.url)
      if uri.host == 'www.youtube.com'
        params = CGI::parse("#{uri.query}")
        params['v'].first
      else
        nil
      end
    end

end
