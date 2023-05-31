class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :instruments
  has_many :rentouts, :through => :instruments, :source => :bookings
  # has_many :rentouts, through: :instruments, source: :bookings
  has_many :bookings
end
