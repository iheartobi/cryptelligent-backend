  class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:index, :show]


  # GET /teams
  def index
    teams = Team.all
    render :json => teams.to_json(:include => { :user => { :only => :username }}), status: :ok
  end

  # GET /teams/1
  def show
    @team = Team.find_by(id: params[:id])
    render :json => @team.to_json(:include => { :user => { :only => :username }}), status: :ok
  end

  # POST /teams
  def create
    @team = Team.new(team_params)

    if @team.save
      render json: @team, status: :created, location: @team
    else
      render json: @team.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  def update
    @team = Team.find_by(id: params[:id])
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team = Team.find_by(id: params[:id])
    @team.destroy
    render json: { message: “removed” }, status: :ok

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:name, :roster, :points, :rank, :wins, :loss, :tie)
    end
  end
