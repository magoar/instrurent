class Booking < ApplicationRecord
  # status can have four values:
  # default is "pending" (the owner hasn't accepted or reject the booking yet)
  # "accepted" (the owner has accepted the booking)
  # "rejected" (the owner has rejected the booking, or the booking wasn't accepted in time)
  belongs_to :user
  belongs_to :instrument
  validates :rent_date, presence: true
  validates_associated :user
  validates_associated :instrument
end

# Status Values TODO for later/never
# "completed" - TODO for later -> a booking was accepted and now the date is in the past
# "cancelled_by_user" - TODO for later -> a user cancelled a booking
# "cancelled_by_owner" - TODO for later -> a owner cancelled a booking after having accepted it
