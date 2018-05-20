class EjecutionRecordsController < ApplicationController
  def index
    @machine = Machine.find(params[:machine_id])
  end

  def new
    @machine= Machine.find(params[:machine_id])
    @ejecution_record = @machine.ejecution_records.build
  end

  def create
  end

  def edit
        @machine = Machine.find(params[:machine_id])
        @ejecution_record = EjecutionRecord.find(params[:id])
    end

    def update
        @machine = Machine.find(params[:machine_id])
        @ejecution_record = @machine.ejecution_records.find(params[:id])

        if @ejecution_record.update_attributes(ejecution_record_params)
            redirect_to @machine
        else
            render :edit
        end
    end
  
  def destroy 
  end
  
  protected
    def ejecution_record_params(my_params)
      my_params.permit(:description, :comments, :machine_id)
    end

end
