class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_person_name
  has_one_attached :avatar

  # As an owner:
  has_many :cars
  has_many :car_bookings, through: :cars,
                          source_type: 'Booking'

  # As a renter
  has_many :bookings, dependent: :destroy
  has_many :booked_cars, through: :bookings,
                         source_type: 'Car'

  has_many :favorites, dependent: :destroy
  has_many :favorite_cars, through: :favorites,
                           source_type: 'Car'
end
