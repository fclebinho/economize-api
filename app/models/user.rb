class User < ApplicationRecord
	has_many :entries, dependent: :delete_all
	has_many :tags, dependent: :delete_all
end
