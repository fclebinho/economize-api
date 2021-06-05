class Entry < ApplicationRecord
	has_many :tags_entries
  has_many :tags, through: :tags_entries

  has_many :users_entries
  has_many :users, through: :users_entries

  belongs_to :user
	enum kind: [:debit, :credit]

	validates_presence_of :due_date, :title, :amount, :kind, :user
end
