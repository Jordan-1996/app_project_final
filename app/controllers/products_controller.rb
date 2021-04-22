class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy, :show]

  def index
    @products = Product.all
  end

  def show 
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.json {head :no_content}
        format.js
      else
        debugger
        format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end 
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end


  private
  def product_params
    params.require(:product).permit(:name_product, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end