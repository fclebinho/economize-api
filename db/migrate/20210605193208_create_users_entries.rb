class CreateUsersEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :users_entries, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :entry, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
