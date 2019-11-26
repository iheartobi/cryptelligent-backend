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

  # POST /coins
  # def create
  #   @coin = Coin.new(coin_params)

  #   if @coin.save
  #     render json: @coin, status: :created, location: @coin
  #   else
  #     render json: @coin.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /coins/1
  # def update
  #   if @coin.update(coin_params)
  #     render json: @coin
  #   else
  #     render json: @coin.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /coins/1
  # def destroy
  #   @coin.destroy
  # end

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


