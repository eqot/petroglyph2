class Solution < ActiveRecord::Base
  belongs_to :problem
  validates :title, presence: true
end
