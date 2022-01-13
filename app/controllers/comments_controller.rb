class CommentsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_comment, only: [:create, :edit, :update, :destroy]
  # load_and_authorize_resource
  def create
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save!
      redirect_to @product
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @product, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def edit
    @comment = @product.comments.find(params[:id])
  end

  def destroy
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to products_url, notice: 'Comment is successfully destroyed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @product = Product.find(params[:product_id])

  end
end
