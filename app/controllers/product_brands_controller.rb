# frozen_string_literal: true

class ProductBrandsController < ApplicationController
  def index
    @product_brands = ProductBrand.all.order(:name)
  end

  def new
    @product_brand = ProductBrand.new
  end

  def create
    @product_brand = ProductBrand.new(product_brands_params)

    if @product_brand.save
      redirect_to product_brands_path
    else
      flash[:errors] = 'No se pudo crear la marca'
      render :new
    end
  end

  def edit
    @product_brand = ProductBrand.find(params[:id])
  end

  def update
    @product_brand = ProductBrand.find(params[:id])

    if @product_brand.update_attributes(product_brands_params)
      redirect_to product_brands_path
    else
      render :edit
    end
  end

  def destroy
    @product_brand = ProductBrand.find(params[:id])
    @products_used_by_brand = Product.find_by(product_brand_id: @product_brand.id)

    if @products_used_by_brand == nil
      @product_brand.destroy
      redirect_to product_brands_path
    else
      flash[:alert] = 'No es posible borrar la Marca: ' + @product_brand.name + ' porque hay productos que son de esa marca.'
      redirect_to action: 'index'
    end
  end

  protected

  def product_brands_params
    params.require(:product_brand).permit(:name)
  end
end
