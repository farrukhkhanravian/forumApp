ActiveAdmin.register Product do
  permit_params :title, :description, :price

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :price
    actions
  end

  form do |f|
    f.inputs do
      input :title
      input :description
      input :price
      f.actions
    end
  end

  controller do
    def create
      @product = Product.new(product_params)
      @product.resource = current_admin_user
      if @product.save!
        redirect_to admin_products_path
      end
    end

    private

    def product_params
      params.require(:product).permit(:title, :description, :price)
    end
  end

end
