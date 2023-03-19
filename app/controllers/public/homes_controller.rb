class Public::HomesController < ApplicationController

  def top
    @reviews = Review.limit(6)
  end



  def about
  end

  def guest
    customer          = Customer.new(customer_params)
    customer.nickname     = "ゲストユーザー"
    customer.email    = SecureRandom.alphanumeric(15) + "@email.com"
    customer.password = SecureRandom.alphanumeric(10)
    customer.save
    sign_in customer
    redirect_to root_path
  end

  private

  def customer_params
    params.permit(:nickname, :email, :password)
  end

end
