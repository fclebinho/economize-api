class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.datetime :due_date
      t.string :title
      t.string :describe
      t.decimal :amount, precision: 15, scale: 2
      t.integer :kind, default: 0
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
