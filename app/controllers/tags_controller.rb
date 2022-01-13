class TagsController < ApplicationController

  def show
    set_tags
  end

  def set_tags
    @tag = Tag.find(params[:id])
  end
end
