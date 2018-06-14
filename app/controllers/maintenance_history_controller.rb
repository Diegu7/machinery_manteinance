class MaintenanceHistoryController < ApplicationController
	def index
		@programmed_maintenances_history = ProgrammedMaintenance.where(done: true).order('scheduled_at DESC')
	end
end
