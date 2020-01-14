  class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:index, :create, :show, :update]
    # dont forget to come back and change the authorized

  # GET /users
  def index
    @users = User.all
    render json: @users.to_json(include: ['coins']) 
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
		render json: @user.as_json(:include => :coins), status: :ok
  end


 def profile
  render json: { user: UserSerializer.new(current_user) }, status: :accepted
end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: @token }, :include => :coins, status: :created
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update 
    @user = User.find_by(id: params[:id])
   if  @user.update(user_params)
    render json: @user.as_json(:include => :coins), status: :ok
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: @user, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :username, :email, :password, :img_url, :bg_url, :coinbank)
    end
end
