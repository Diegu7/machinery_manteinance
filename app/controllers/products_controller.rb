# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all.order(:name)
    @product = Product.new

    if params[:brand].present?
      brand = ProductBrand.find(params[:brand])
      @products = brand.products.order(:name)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    @product.name = @product.name << ' ' << (@product.code || '')

    if @product.save
      redirect_to @product
    else
      flash[:errors] = 'No se pudo registrar el producto'
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @product.name = @product.name << ' ' << (@product.code || '')
  end

  def update
    @product = Product.find(params[:id])
    @product.name = @product.name << ' ' << (@product.code || '')

    if @product.update_attributes(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @usedproduct=@product.materials_for_maintenances
    
    if @usedproduct.empty?
      @product.destroy
      redirect_to products_path
    else
      flash[:alert] = 'No es posible borrar este producto debido a que fue utilizado en un mantenimiento y se perderian los registros del mismo.'
      redirect_to action: 'index'
      
    end
 
  end

  protected

  def product_params
    params.require(:product).permit(:name, :image, :product_brand_id, :initial_stock, :current_stock, :minimum, :maximum, :specifications, :code, :provider)
  end
end
