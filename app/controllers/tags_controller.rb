class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @farms = @tag.farms
  end
end
