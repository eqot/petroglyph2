class Problem < ActiveRecord::Base
  has_many :solutions
  validates :title, presence: true
  validates :description, presence: true
end
