class UsersEntry < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  validates_uniqueness_of :user, scope: :entry
  validates_presence_of :user, :entry
end
