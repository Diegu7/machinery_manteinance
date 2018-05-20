class EjecutionRecordsController < ApplicationController
  def index
    @specifications= EjecutionRecords.all
  end

  def new
    @machine= Machine.find(params[:machine_id])
    @machine.ejecution_records.build
  end

  def create
  end

  def edit
        @machine = Machine.find(params[:machine_id])
        @ejecution_record = EjecutionRecords.find(params[:id])
    end

    def update
        @machine = Machine.find(params[:machine_id])
        @ejecution_record = @machine.ejecution_records.find(params[:id])

        if @ejecution_record.update_attributes(ejecution_records_params)
            redirect_to @machine
        else
            render :edit
        end
    end
  
  def destroy 
  end
  
  protected
    def specification_params2(my_params)
      my_params.permit(ejecution_records_attributes [:key, :value])
    end

    def specification_params(my_params)
      my_params.permit(:description, :comments, :machine_id)
    end

end
