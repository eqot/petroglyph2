require 'uri'

class Video < ActiveRecord::Base
  belongs_to :user
  has_many :contains
  has_many :containers, through: :contains, source: :playlist

  default_scope -> { order('created_at DESC') }

  validates :url, presence: true, format: URI::regexp(%w(http https))
  validates :user_id, presence: true
end
