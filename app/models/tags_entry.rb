class TagsEntry < ApplicationRecord
  belongs_to :tag
  belongs_to :entry

	validates_uniqueness_of :tag, scope: :entry
  validates_presence_of :tag, :entry
end
