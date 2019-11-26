  class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:index]


  # GET /leagues
  def index
    @leagues = League.all
    render json: @leagues, status: :ok
  end

  # GET /leagues/1
  def show
    @league = League.find_by(id: params[:id])
    render json: @league, status: :ok
  end

  # POST /leagues
  def create
    @league = League.new(league_params)

    if @league.save
      render json: @league, status: :created, location: @league
    else
      render json: @league.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leagues/1
  def update
    @league = League.find_by(id: params[:id])
    if @league.update(league_params)
      render json: @league
    else
      render json: @league.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /leagues/1
  def destroy
    @league = League.find_by(id: params[:id])
    @league.destroy
    render json: { message: “removed” }, status: :ok

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def league_params
      params.permit(:name, :tier, :win_amount)
    end
  end
