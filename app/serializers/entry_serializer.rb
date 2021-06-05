class EntrySerializer < ActiveModel::Serializer
  attributes :id, :due_date, :title, :describe, :amount, :kind, :done, :created_at, :updated_at

	has_one :user
	has_many :users
	has_many :tags
end
