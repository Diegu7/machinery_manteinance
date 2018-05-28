# frozen_string_literal: true

class ChangeDefaultValueProgMaintenanceDone < ActiveRecord::Migration[5.1]
  def change
    change_column_default :programmed_maintenances, :done, false
  end
end
