class Reservation < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :room
  validates :check_in, :check_out, :guest,:user_id, :room_id, presence: true
  validate :start_end_check

  def staydays
    (check_out - check_in)/86400
  end

  def payment
    (guest * staydays * room.charge).to_i
  end

  def start_end_check
    if self.check_in.nil?
        errors.add(:check_in, "を入力してください")
    elsif self.check_out.nil?
        errors.add(:check_out, "を入力してください")
    else
        errors.add(:check_out, "は開始日より前の日付は登録できません。") unless
        self.check_in < self.check_out
    end
  end
end
