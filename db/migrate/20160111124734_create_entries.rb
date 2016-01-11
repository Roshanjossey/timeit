class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :date
      t.references :user, index: true, foreign_key: true
      t.string :project
      t.float :duration
      t.boolean :billable
      t.text :description

      t.timestamps null: false
    end
  end
end
