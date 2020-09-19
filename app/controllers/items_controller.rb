class ItemsController < ApplicationController
  def index
    @farms = Farm.includes(:farmer)
  end
end
