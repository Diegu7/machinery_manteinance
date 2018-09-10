# frozen_string_literal: true

class ProductDurabilitiesController < ApplicationController
  def index
    # @product_durability_comp = ProgrammedMaintenance.joins(:materials_for_maintenances).order(:scheduled_at).group(:id).count(:estimated_duration)
    respond_to do |format|
      format.html
      format.pdf do
        render template: "product_durabilities/prod-dur-pdf", 
          pdf: "Durabilidad de Repuestos - "+ Time.now.strftime("%v %H:%M:%S").to_s,
          viewport_size: '1280x1024',
          print_media_type: true
      end
    end

    @materials_maintenances = MaterialsForMaintenance.select(:programmed_maintenance_id, :product_id, :created_at).order("created_at DESC")

    @all_machines = Array.new

    @materials_maintenances.each do |mat_maint| 
      @prog_maint = ProgrammedMaintenance.select('machine_id').find_by(id: mat_maint.programmed_maintenance_id)
      @machine = Machine.select('name').find_by(id: @prog_maint.machine_id)

      if not @all_machines.include? @machine.name 
        @all_machines.push(@machine.name)
      end
    end

    @all_machines = @all_machines.sort
  end

  def new
    @product_durability = ProductDurability.new
  end

  def create
    @product_durability = ProductDurability.new(product_durability_params)
    if @product_durability.save
      redirect_to product_durability_path(@product_durability.id)
    else
      render :new
    end
  end

  def product_durability_params
    params.require(:product_durability).permit(:product, :durability)
  end
end
