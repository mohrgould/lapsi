class Camera < ActiveRecord::Base
  has_many :frames
  belongs_to :user
  belongs_to :last_frame, class_name: 'Frame', foreign_key: 'last_frame_id'

  validates :name, presence: true

  def self.with_frames
    Camera.where('last_frame_id is not null')
  end
end
