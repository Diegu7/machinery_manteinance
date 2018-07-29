class AddCommentsToRequiredMaintenance < ActiveRecord::Migration[5.1]
  def change
    add_column :required_maintenances, :comments, :string
  end
end
