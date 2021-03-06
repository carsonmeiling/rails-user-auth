class AccountsController < ApplicationController
  before_action :set_account, only: [:edit, :show, :update, :destroy]


  def index
    @accounts = current_user.accounts
  end

  def show
  end

  def new
    @account = current_user.accounts.new
  end

  def create
    @account = current_user.accounts.new(account_params)
    if @account.save
      flash[:success] = "Account Created"
      redirect_to accounts_path
    else
      flash[:error] = "Account could not be created" 
      render :new
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to accounts_path
    else 
      render :edit
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :balance)
  end

  def set_account
    @account = current_user.accounts.find(params[:id])
  end


end
