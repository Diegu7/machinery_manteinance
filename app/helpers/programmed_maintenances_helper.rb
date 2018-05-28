# frozen_string_literal: true

module ProgrammedMaintenancesHelper
  def self.events
    ProgrammedMaintenance.pending.map { |m| Event.new(m) }
  end
end
