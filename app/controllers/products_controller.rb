class ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :set_global_product, only: [:like, :unlike]
  #remove show action from the set product that the show to the user comments and post both


  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      @product.create_tags(params[:products][:tagging_attributes][:tag_ids]) if params[:products].present?
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      if params[:products].present?
        @product.create_tags(params[:products][:tagging_attributes][:tag_ids])
      else
        @product.taggings.destroy_all if @product.taggings.present?
      end
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  def like
    @product.like(current_user)
    redirect_to product_path(@product), notice: 'You liked the Post.'
  end

  def unlike
    @product.unlike(current_user)
    redirect_to product_path(@product), notice: 'You unliked the Post.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :description, :categoryType,
                                    tagging_attributes: [:id, :value, {tag_ids: []}])
  end

  def set_product
    @product = current_user.products.find(params[:id])
  end

  def set_global_product
    @product = Product.find(params[:id])
  end
end
