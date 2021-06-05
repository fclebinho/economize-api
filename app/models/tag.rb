class Tag < ApplicationRecord
  belongs_to :user
	validates_presence_of :title, :user

  has_many :tags_entries
  has_many :entries, through: :tags_entries
end
