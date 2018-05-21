class EjecutionRecordsController < ApplicationController
  def index
    @machine = Machine.find(params[:machine_id])
  end

  def new
    @machine= Machine.find(params[:machine_id])
    @ejecution_record = @machine.ejecution_records.build
  end

  def create
    @machine = Machine.find(params[:machine_id])
    @ejecution_record = @machine.ejecution_records.build(ejecution_record_params)

        if @ejecution_record.save
            redirect_to @machine
        else
            flash[:errors] = "No se pudo crear la ficha de ejecucion"
            render :new
        end
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
    def ejecution_record_params
      params.require(:ejecution_record).permit(:description, :estimated_duration,:comments,:scheduled_at,:finish_at,:machine_id)
    end

end
