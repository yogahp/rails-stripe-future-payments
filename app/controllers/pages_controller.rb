class PagesController < ApplicationController
    def index
    end

    def checkout
        Stripe.api_key = ENV['STRIPE_API_KEY']
        random_string = SecureRandom.hex

        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            mode: 'setup',
            customer: "cus_PAYWTDfoOzoUBS",
            # customer: params[:customer_id],
            success_url: 'http://localhost:3000/checkout-success?session_id=' + random_string,
            cancel_url: 'http://localhost:3000/checkout-cancel',
        )

        cookies[:checkout_session_id] = session.id

        redirect_to root_url(next_url: session.url)
    end

    def create_customer
        Stripe.api_key = ENV['STRIPE_API_KEY']

        customer = Stripe::Customer.create({
            name: 'Yoga Hapriana',
            email: 'thenelse.v2@gmail.com',
        })

        redirect_to root_url(customer_id: customer.id)
    end

    def checkout_success
        Stripe.api_key = ENV['STRIPE_API_KEY']
        data = Stripe::Checkout::Session.retrieve(cookies[:checkout_session_id])

        redirect_to root_url(setup_intent: data.setup_intent)
    end

    def setup_intent
        Stripe.api_key = ENV['STRIPE_API_KEY']
        data = Stripe::SetupIntent.retrieve(params[:setup_intent])

        redirect_to root_url(pm: data.payment_method)
    end
end
