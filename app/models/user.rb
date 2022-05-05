class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flats, dependent: :destroy
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :received_bookings, through: :flats, source: :bookings # received_booking is booking you receive from other people
  has_many :bookings # booking you create for yourself.
end
