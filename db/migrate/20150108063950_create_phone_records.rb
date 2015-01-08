class CreatePhoneRecords < ActiveRecord::Migration
  def change
    create_table :phone_records do |t|
      t.string     :phone_num, null:false
      t.integer    :duration
      t.boolean    :status
      t.timestamps :call_at
      t.timestamps :answer_at
      t.timestamps :end_at
      t.belongs_to :work_order, index:true
      t.timestamps
    end
  end
end
