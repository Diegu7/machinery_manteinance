# frozen_string_literal: true

class RemoveCategoryFromMachines < ActiveRecord::Migration[5.1]
  def change
    remove_reference :machines, :machine_category, foreign_key: true
  end
end
