# frozen_string_literal: true

class AddDescriptionToMachine < ActiveRecord::Migration[5.1]
  def change
    add_column :machines, :description, :text
  end
end
