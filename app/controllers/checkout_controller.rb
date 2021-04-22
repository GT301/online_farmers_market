class CheckoutController < ApplicationController
  def create
    # establish a connection with Stripe!
    # redirect the user back to a payment screen
    products = Product.find(session[:shopping_cart].keys)

    if products.nil?
      redirect_to root_path
      return
    end

    line_items = []

    products.each do |p|
      line_items.push(
        {
          name:     p.product_name,
          amount:   (p.price * 100).to_i,
          currency: "cad",
          quantity: session[:shopping_cart][p.id.to_s]
        }
      )
    end

    line_items.push(
      {
        name:     "Tax",
        amount:   (subtotal * current_user.province.total_tax_rate).to_i,
        currency: "cad",
        quantity: 1
      }
    )

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          "#{checkout_success_url}?session_id={CHECKOUT_SESSION_ID}",
      cancel_url:           checkout_cancel_url,
      line_items:           line_items
    )

    # @session.id <== is autopopulated from this process!

    respond_to do |format|
      format.html # render app/views/checkout/create.js.erb
    end
  end

  def success
    # We took the customer's money!
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    # Something went wrong with the payment :(
  end
end
