class User < ApplicationRecord
 before_save { self.email = email.downcase }
 validates :name, presence: true, length: { maximum: 30 }
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, length: { maximum: 30 },
 format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensative: false }
 
 has_secure_password
 validates :password, presence: true, length: { minimum: 5 }
 validates :user_type, presence: true

 has_many :projects


end
