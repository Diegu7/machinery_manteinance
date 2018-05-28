# frozen_string_literal: true

class RenameMaintenanceNotificationsColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :maintenance_notifications, :schedule_at, :scheduled_at
  end
end
