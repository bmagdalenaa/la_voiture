class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def create
    province = current_user.province
    tax_rate_id = retrieve_or_create_stripe_tax_rate(province)

    line_items = @cart.map do |vehicle_id, quantity|
      vehicle = Vehicle.find(vehicle_id)
      {
        name: vehicle.model.name,
        amount: vehicle.price_cents * quantity, # Total amount in cents..... need to create cents
        currency: 'cad',
        quantity: 1,
        tax_rates: [tax_rate_id]
      }
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
    )

    # Redirect to Stripe Checkout
    redirect_to session.url, allow_other_host: true
  end

  private

  def set_cart
    # Make sure this method or association exists on the User model.
    @cart = current_user.cart || session[:cart]
  end

  def retrieve_or_create_stripe_tax_rate(province)
    # need to add - check if the tax rate exists in Stripe
    # and if not, create it using the Stripe API.

    # Check if a Stripe tax rate for this province exists in our database.
    tax_rate = TaxRate.find_by(province: province)

    unless tax_rate
      # Create a new tax rate in Stripe and save the ID to our database.
      stripe_tax_rate = Stripe::TaxRate.create({
        display_name: "#{province.name} Tax",
        description: "Sales tax for #{province.name}.",
        jurisdiction: province.name,
        percentage: province.total_tax_rate * 100,
        inclusive: false
      })

      # Save the new tax rate to our database for later.
      tax_rate = TaxRate.create(
        province: province,
        stripe_tax_rate_id: stripe_tax_rate.id
      )
    end

    tax_rate.stripe_tax_rate_id
  end

  # construct the success and cancel URLs later.
  def checkout_success_url
    # Replace with the actual URL helper for the success route.
    root_url
  end

  def checkout_cancel_url
    # Replace with the actual URL helper for the cancel route.
    root_url
  end
end
