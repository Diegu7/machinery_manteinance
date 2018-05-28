# frozen_string_literal: true

class EjecutionRecord < ApplicationRecord
  belongs_to :machine

  validates_presence_of :description
  validates_presence_of :scheduled_at

  def self.update_or_create(attributes)
    assign_or_new(attributes).save
  end

  def self.assign_or_new(attributes)
    obj = first || new
    obj.assign_attributes(attributes)
    obj
  end
end
