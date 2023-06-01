class Instrument < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  # validations
  validates :name, presence: true
  validates :instrument_type, presence: true
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [ :name, :instrument_type ],
                  associated_against: {
                    user: [ :first_name, :last_name ]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
