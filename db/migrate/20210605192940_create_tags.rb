class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags, id: :uuid do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
