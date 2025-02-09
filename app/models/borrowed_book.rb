class BorrowedBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  before_create :set_default_due_date

  private

  def set_default_due_date
    self.due_date = 14.days.from_now
  end
end
