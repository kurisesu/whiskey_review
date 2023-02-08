class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @customers = Customer.all
  end


end

private

  def customer_params
    params.require(:customer).permit(:nickname, :email, :is_deleted)
  end
