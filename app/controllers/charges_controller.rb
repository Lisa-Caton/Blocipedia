class ChargesController < ApplicationController

  # before_filter :authenticate_user!

  def new
  end

  def create
    # Amount in cents
    @amount = 900

    # Creates a Stripe Customer object, for associatingwith the charge
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
