# frozen_string_literal: true

class CreateEjecutionRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :ejecution_records do |t|
      t.string :description
      t.date :scheduled_at
      t.integer :estimated_duration
      t.date :finish_at
      t.string :comments
      t.references :machine, foreign_key: true

      t.timestamps
    end
  end
end
