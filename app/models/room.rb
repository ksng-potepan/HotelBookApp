class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    validates :accommodation, :guide, :charge, :address, presence: true
end
