class CheckoutController < ApplicationController
  def create
    # establish a connection with Stripe!
    # redirect the user back to a payment screen
    @product = Product.find(params[:product_id])

    if @product.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          checkout_success_url + "?sessoin_id={CHECKOUT_SESSION_ID}",
      cancel_url:           checkout_cancel_url,
      line_items:           [
        {
          name:        product.product_name,
          description: product.description,
          amount:      100,
          currency:    "cad",
          quantity:    1
        },
        {
          name:        "GST",
          description: "Goods and Services Tax",
          amount:      100,
          currency:    "cad",
          quantity:    1
        }
      ]
    )

    # @session.id <== is autopopulated from this process!

    respond_to do |format|
      format.js # render app/views/checkout/create.js.erb
    end
  end

  def success
    # We took the customer's money!
    @session = Stripe::Checkout::Session.retrive(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrive(@session.payment_intent)
  end

  def cancel
    # Something went wrong with the payment :(
  end
end
