# frozen_string_literal: true

class Event
  def initialize(programmed_maintenance)
    @id = programmed_maintenance.id
    @title = programmed_maintenance.description
    @start = (programmed_maintenance.scheduled_at.to_datetime + 8.hour)
    @end = @start + programmed_maintenance.estimated_duration.hour
    @description = programmed_maintenance.comments

    @color = if DateTime.now < @start
               'green'
             elsif DateTime.now >= @start && DateTime.now <= @end
               '#DAA520'
             else
               'red'
             end
  end
end
