# frozen_string_literal: true

class Event
  def initialize(programmed_maintenance)
    @id = programmed_maintenance.id
    @title = programmed_maintenance.description
    @comments = programmed_maintenance.comments
    @start = (programmed_maintenance.last_time_done_at.to_datetime + 8.hour)
    @end = @start + programmed_maintenance.estimated_duration.hour
    @description = programmed_maintenance.description

    @color = if @comments == "Alta"
               'brown'
             elsif @comments == "Mediana"
                'orange'
              elsif @comments == "Baja"
                'yellow'
             elsif DateTime.now < @start
               'green'
             elsif DateTime.now >= @start && DateTime.now <= @end
               '#DAA520'
             else
               'red'
             end
  end
end
