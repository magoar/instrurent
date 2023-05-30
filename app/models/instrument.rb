class Instrument < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  # validations
  validates :name, presence: true
  validates :instrument_type, presence: true
  validates :description, presence: true
end
