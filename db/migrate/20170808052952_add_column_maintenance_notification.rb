# frozen_string_literal: true

class AddColumnMaintenanceNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :maintenance_notifications, :remaining_days, :int
  end
end
