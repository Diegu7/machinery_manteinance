# frozen_string_literal: true

class MachinesController < ApplicationController
  def index
    @machines = Machine.all.order(:name)

    if params[:section].present?
      section = MachineSection.find(params[:section])
      @machines = section.machines.order(:name)
    end
  end

  def new
    @machine = Machine.new
  end

  def show
    @machine = Machine.find(params[:id])
    @datasheets = @machine.technical_specifications
    @finishedMaintenances = @machine.programmed_maintenances.where(done: true)
    @requiredMaintenances = @machine.required_maintenances
    @ejecutionRecords = @machine.ejecution_records
    params[:type] = "Preventivo"

    respond_to do |format|
      format.html
      format.pdf do
        render template: "machines/fichas", 
          pdf: "Ficha de Ejecución - " + @machine.name + " - " + Time.now.strftime("%v %H:%M:%S").to_s,
          viewport_size: '1280x1024',
          print_media_type: true
      end
    end
  end

  def create
    @machine = Machine.new(machine_params)

    if @machine.save
      @machine.technical_specifications.create
      redirect_to @machine
    else
      flash[:errors] = 'No se pudo registrar la maquina'
      render :new
    end
  end

  def edit
    @machine = Machine.find(params[:id])
  end

  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy
    redirect_to machines_path
  end

  def update
    @machine = Machine.find(params[:id])

    if @machine.update_attributes(machine_params)
      redirect_to @machine
    else
      render :edit
    end
  end

  protected

  def machine_params
    params.require(:machine).permit(:name, :machine_category_id, :machine_section_id, :description, :image, :lubrication)
  end
end
