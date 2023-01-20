class Patient < ApplicationRecord
    has_secure_password 
    has_many :appointments 
    has_many :doctors, through: :appointments
     validates :password, confirmation: true
     validates :name ,presence: true
end
