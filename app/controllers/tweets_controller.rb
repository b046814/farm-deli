class TweetsController < ApplicationController

  def new
    @farm = Farm.find(params[:farm_id])
    @tweet = Tweet.new
  end

  def create
    @farm = Farm.find(params[:farm_id])
    @tweet = Tweet.new(tweet_params)
    @tweet.farm_id = @farm.id
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :image)
  end

end
