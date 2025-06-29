class Passenger < ApplicationRecord
  belongs_to :booking

  validate :booking_is_valid
  validates :email, :name, presence: true
  validates :name, length: { in: 4..16 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  private
  def booking_is_valid
    if booking.present? && booking.invalid?
      errors.add(:booking, "is not valid")
    end
  end
end
