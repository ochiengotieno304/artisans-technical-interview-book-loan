class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :borrowed_books
  has_many :books, through: :borrowed_books

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
