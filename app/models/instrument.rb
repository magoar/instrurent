class Instrument < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings
  # validations
  validates :name, presence: true
  validates :instrument_type, presence: true
  validates :description, presence: true
end
