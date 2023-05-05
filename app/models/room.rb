class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :reservations


    validates :accommodation, :guide, :charge, :address, presence: true
    validates :charge, numericality: {only_integer: true, greater_than_or_equal_to: 1}
end
