class CreateBorrowedBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :borrowed_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :borrowed_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :returned_at
      t.datetime :due_date, null: false

      t.timestamps
    end

    add_index :borrowed_books, [ :user_id, :book_id ], unique: true
  end
end
