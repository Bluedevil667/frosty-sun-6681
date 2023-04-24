class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  def self.adult_patients_in_alphabetical_order
    where('age > ?', 18).order(name: :asc)
  end
end