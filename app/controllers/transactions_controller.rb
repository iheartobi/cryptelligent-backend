class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:index, :create, :destroy, :show]

  # GET /transactions
  def index
    @transactions = Transaction.all
    render json: @transactions, status: :ok
  end

  # GET /transactions/1
  def show
    @transaction = Transaction.find_by(id: params[:id])
    render json: @transaction, status: :ok
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(user_id: transaction_params['user_id'], coin_id: transaction_params['coin_id'] )

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors.full_messages, status: :unprocessable_entity
    end
  end


  # DELETE /transactions/1
  def destroy
    currentUser = User.find(transaction_params[:user_id])
    @transaction = currentUser.transactions.find_by(coin_id: transaction_params[:coin_id])
    # @transaction = Transaction.find_by(id: params[:id])
    if  @transaction.destroy
    render json: @transaction, status: :ok
    else
      render json: @transaction.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_params
      params.permit(:user_id, :coin_id)
    end
end
