class AddProjectIdToEntries < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.remove :project
      t.references :project, index: true, foreign_key: true
    end
  end
end
