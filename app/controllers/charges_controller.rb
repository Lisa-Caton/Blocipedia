class ChargesController < ApplicationController

  # before_filter :authenticate_user!

  def new
    @stripe_btn_data = {
    :key => "#{ Rails.configuration.stripe[:publishable_key] }",
    :description => "BigMoney Membership - #{current_user.name}",
    :amount => @amount
  }
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
      :description => 'BigMoney Membership - #{current_user.email}',
      :currency    => 'usd'
    )

    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
   redirect_to root_path(current_user) # or wherever

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
