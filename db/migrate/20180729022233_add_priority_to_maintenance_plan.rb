class AddPriorityToMaintenancePlan < ActiveRecord::Migration[5.1]
  def change
    add_column :maintenance_plans, :priority, :string
  end
end
