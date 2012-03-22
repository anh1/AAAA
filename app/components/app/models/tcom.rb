class Tcom < ActiveRecord::Base

  belongs_to :user

  before_save :youtube_shorten

  private

  # Shorten youtube video HTTP link, strip iframe tags and leave only video ID.
  def youtube_shorten
    if self.youtube_video
      self.youtube_video = self.youtube_video.sub(/^.*http:\/\/www.youtube.com\/\w+\/([^ ]+).*$/, '\1')
    end
  end
	
end
