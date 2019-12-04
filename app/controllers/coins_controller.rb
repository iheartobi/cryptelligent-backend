class CoinsController < ApplicationController
  before_action :set_coin, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:index]


  # GET /coins
  def index
    @coins = Coin.all
    render json: @coins, status: :ok
  end

  # GET /coins/1
  def show
    @coin = Coin.find_by(id: params[:id])
    render json: @coin, status: :ok
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coin_params
      params.permit(:name, :currency, :symbol, :logo_url, :price, :rank, :price_date, :market_cap, :circulating_supply, :max_supply, :high, :high_timestamp, :max_sold)
    end
end


