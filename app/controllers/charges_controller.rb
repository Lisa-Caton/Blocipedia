class ChargesController < ApplicationController

  # before_filter :authenticate_user!

  def new
    @stripe_btn_data = {
        :key => Rails.configuration.stripe[:publishable_key].to_s,
        :description => "BigMoney Membership - #{current_user.email}",
        :amount => 900
    }
  end

  def create
    # Amount in cents
    @amount = 900

    # Creates a Stripe Customer object, for associatingwith the charge
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source => params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => "BigMoney Membership - #{current_user.email}",
      :currency => 'usd'
    )

    current_user.update_attribute(:role, 'premium')

    if current_user.save!
      flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
      redirect_to root_path(current_user) # or wherever
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def update

    if current_user.update!
      current_user.update_attribute(:role, 'standard')
      flash[:notice] = "Thanks for the opportunity, but you have been downgraded."
      redirect_to root_path(current_user) # or wherever
    end
  end

end
