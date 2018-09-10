class MaintenanceHistoryController < ApplicationController
	def index
		@programmed_maintenances_history = ProgrammedMaintenance.where(done: true).order('scheduled_at DESC')

		@all_machines = Array.new

		@programmed_maintenances_history.each do |prog_maint|
			@mach = Machine.select('name').find_by(id: prog_maint.machine_id)

			if not @all_machines.include? @mach.name
				@all_machines.push(@mach.name)
			end
		end

		@all_machines = @all_machines.sort

		respond_to do |format|
	      format.html
	      format.pdf do
	        render template: "maintenance_history/maint-hist-pdf", 
	          pdf: "Historial de Mantenimientos - "+ Time.now.strftime("%v %H:%M:%S").to_s,
	          viewport_size: '1280x1024',
	          print_media_type: true
	      end
	    end
	end
end
