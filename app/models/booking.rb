class Booking < ApplicationRecord
  enum status: { pending: 0, accepted: 1, rejected: 2 }
  belongs_to :flat
  belongs_to :user
  # calling your model method
  # booking.accepted?
  # booking.rejected?
  # booking.pending?
end
