class PagesController < ApplicationController
    def index
    end

    def checkout
        Stripe.api_key = ENV['STRIPE_API_KEY']

        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            mode: 'setup',
            customer: '1',
            success_url: 'https://example.com/success?session_id=1',
            cancel_url: 'https://example.com/cancel',
        )
        
        redirect_to root_url
    end
end
