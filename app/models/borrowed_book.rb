class BorrowedBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_uniqueness_of :user_id, scope: :book_id
  validates_presence_of :due_date

  before_create :set_default_due_date

  private

  def set_default_due_date
    self.due_date  ||= 14.days.from_now
  end
end
