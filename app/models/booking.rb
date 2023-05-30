class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  validates :rent_date, presence: true
  validates_associated :user
  validates_associated :instrument
end
