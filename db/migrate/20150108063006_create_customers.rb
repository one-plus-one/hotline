class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string  :name
      t.integer :age
      t.string  :gender
      t.string :phone_num, null:false, unique:true
      t.string  :disability_degree
      t.string  :education
      t.string  :occupation
      t.boolean :marital_status
      t.string  :address
      t.string  :address_type
      t.string  :channel
      t.timestamps
    end
  end
end
