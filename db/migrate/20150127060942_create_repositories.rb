class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :title
      t.text :answer
      t.references :catalog
      t.timestamps
    end
  end
end
