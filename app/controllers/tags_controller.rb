class TagsController < ApplicationController
  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @farms = @tag.farms
  end
end
