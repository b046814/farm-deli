class TweetsController < ApplicationController
  before_action :set_farm, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :move_to_root, only: [:new, :create, :edit, :update, :destroy]

  def index
    @tweets = @farm.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.farm_id = @farm.id
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to farm_tweets_path(@farm)
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
      redirect_to farm_tweets_path(@farm)
    else
      redirect_to farm_tweets_path(@farm)
    end
  end


  private

  def tweet_params
    params.require(:tweet).permit(:content, :image)
  end

  def set_farm
    @farm = Farm.find(params[:farm_id])
  end

  def move_to_root
    return if farmer_signed_in? && current_farmer.farm.id == @farm.id

    redirect_to root_path
  end

end
