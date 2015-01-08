class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.string     :status,       deflaut:'未解决', null:false
      t.timestamps :created_at
      t.timestamps :updated_at
      t.belongs_to :customer, index:true
      t.belongs_to :users, index:true
      t.timestamps
    end
  end
end
