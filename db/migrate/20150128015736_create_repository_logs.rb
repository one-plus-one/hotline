class CreateRepositoryLogs < ActiveRecord::Migration
  def change
    create_table :repository_logs do |t|
      t.string :name
      t.string :action
      t.text :event
      t.timestamps
    end
  end
end
