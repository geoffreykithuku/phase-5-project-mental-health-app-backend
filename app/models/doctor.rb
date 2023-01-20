class Doctor < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments
    has_secure_password
    validates :name ,presence: true
    validates :password, confirmation: true

    validates :email,
        format: { with: /\A(.+)@(.+)\z/, message: "invalid"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
end