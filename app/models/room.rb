class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :reservations


    validates :accommodation, :guide, :charge, :address, presence: true
end
