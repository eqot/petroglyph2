class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :contains
  has_many :contained_videos, through: :contains, source: :video

  default_scope -> { order('created_at DESC') }

  validates :title, presence: true
  validates :user_id, presence: true

  def containing?(other_video)
    contains.find_by(video_id: other_video.id)
  end

  def add!(other_video)
    contains.create!(video_id: other_video.id)
  end

  def remove!(other_video)
    contains.find_by(video_id: other_video.id).destroy
  end
end
