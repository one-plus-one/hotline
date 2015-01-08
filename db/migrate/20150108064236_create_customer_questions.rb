class CreateCustomerQuestions < ActiveRecord::Migration
  def change
    create_table :customer_questions do |t|
      t.string  :title
      t.string  :answer
      t.string :note
      t.belongs_to :work_order, index:true
      t.timestamps
    end
  end
end
