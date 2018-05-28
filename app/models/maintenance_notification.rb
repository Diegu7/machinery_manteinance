# frozen_string_literal: true

class MaintenanceNotification < ApplicationRecord
  belongs_to :programmed_maintenance

  validates :machine_name, uniqueness: { scope: [:programmed_maintenance_id] }
end
