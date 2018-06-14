# frozen_string_literal: true

module ProgrammedMaintenancesHelper
  def self.events
    evts = []
    RequiredMaintenance.all.each do |req|
      schedule = IceCube::Schedule.new(req.last_time_done_at)
      schedule.add_recurrence_rule IceCube::Rule.daily(req.frequency_in_days).until(Date.today + (31 * 5)) # 5 meses

      schedule.each_occurrence do |o|
        event = req
        event.last_time_done_at = o
        evts.push Event.new(event)

      end
    end
    return evts
  end
end
