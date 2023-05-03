class Reservation < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :room
  validates :check_in, :check_out, :guest,:user_id, :room_id, presence: true
end
