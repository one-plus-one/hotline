class AddColumnToWorkOrders < ActiveRecord::Migration
  def change
    add_reference :work_orders, :updated_user, user: true, index: true
  end
end
