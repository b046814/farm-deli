class ItemsController < ApplicationController
  def index
    @farms = Farm.includes(:farmer)
    @tags = Tag.all
  end
end
