class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update,:destroy]

  def index
    @prototypes = Prototype.order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    @prototype.tags.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    tags = []
    @prototype.tags.each do |tag|
      _tag = Tag.find_or_create_by(name: tag.name)
      tags <<_tag
    end
    @prototype.tags = tags
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'
    end
  end

  def show
  end

  def edit
    @main = @prototype.captured_images.where(status: 0).first
    @sub = @prototype.captured_images.where(status: 1)
    @new_sub = @prototype.captured_images.where(status: 1).build
    @tags = @prototype.tags
  end

  def update
    _prototype = Prototype.new(prototype_params)
    tags = []
    _prototype.tags.each do |tag|
      _tag = Tag.find_or_create_by(name: tag.name)
      tags <<_tag
    end
    @prototype.tags = tags
    if @prototype.update(update_params)
      redirect_to :root, notice: 'The prototype was successfully updated'
    else
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully updated'
    end
  end

  def destroy
    if @prototype.user_id == current_user.id
    @prototype.destroy
    redirect_to :root, notice: 'prototype was deleted'
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      tag_ids: [],
      captured_images_attributes: [:content, :status],
      tags_attributes: :name
     )
  end

  def update_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
    captured_images_attributes: [:id, :_destroy, :content, :status]
    )
  end

end
