class Tag < ApplicationRecord
  belongs_to :user

  has_many :tags_entries
  has_many :entries, through: :tags_entries
	
	validates_presence_of :title, :user
end
