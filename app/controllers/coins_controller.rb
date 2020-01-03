class CoinsController < ApplicationController
    before_action :set_coin, only: [:show, :update, :destroy]
    skip_before_action :authorized, only: [:index]
  
  
    # GET /coins
    def index
      @coins = Coin.paginate(page: params[:page], per_page: 300)
      render json: @coins, status: :ok
    end
  
    # GET /coins/1
    def show
      @coin = Coin.find_by(id: params[:id])
      render json: @coin, status: :ok
    end

    def create
      @coin = Coin.find_or_create_by!(name: coin_params[:name], currency: coin_params[:currency], symbol: coin_params[:symbol], logo_url: coin_params[:logo_url], price: coin_params[:price], rank: coin_params[:rank], price_date: coin_params[:price_date], market_cap: coin_params[:market_cap], circulating_supply: coin_params[:circulating_supply], max_supply: coin_params[:max_supply], high: coin_params[:high], high_timestamp: coin_params[:high_timestamp], max_sold: coin_params[:max_sold], userId: coin_params[:userId])
		
		if @coin.save
			currentUser = User.find(coin_params[:userID])

			if currentUser.coins.any?{|coin| coin['name'] === @coin['name']}
				render json: @coin, status: :ok

			else
				@coin.users << currentUser
				render json: @coin, status: :created
			end

		else
			render json: @coin.errors.full_messages, status: :unprocessable_entity
		end
    end

    def update
      @coin = Coin.find(params[:id])
      @coin.update(max_sold: coin_params[:max_sold])
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