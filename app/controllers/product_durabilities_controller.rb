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
