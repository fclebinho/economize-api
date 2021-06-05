class User < ApplicationRecord
	has_many :users_entries, dependent: :delete_all
	has_many :guest_entries, through: :users_entries, source: :entry
	
	has_many :entries, dependent: :delete_all
	has_many :tags, dependent: :delete_all

  validates_presence_of :email
end
