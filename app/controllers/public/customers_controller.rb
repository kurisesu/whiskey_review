class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
  @customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "登録情報を編集しました。"
      redirect_to customers_my_page_path(current_customer)
    else
      flash[:alert] = "もう一度入力してください。"
      @customer = current_customer
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :email, :is_deleted)
  end


end



