class TagsController < ApplicationController

  def create
  end

  def update
  end

  def show
    @tag = Tag.find(params[:id])
    @prototypes = @tag.prototypes.order("created_at DESC").page(params[:page]).per(3)
  end
end
