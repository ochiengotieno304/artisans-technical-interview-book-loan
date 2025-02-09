class Book < ApplicationRecord
  has_many :borrowed_books
  has_many :users, through: :borrowed_books

  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :isbn

  before_create :set_available


  private


  def set_available
    self.available = true
  end
end
