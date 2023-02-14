class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(admin_customer_params)
      redirect_to admin_root_path
    else
      render :edit
    end
  end

   private

  def admin_customer_params
    params.require(:customer).permit(:nickname, :email, :is_deleted)
  end

end


