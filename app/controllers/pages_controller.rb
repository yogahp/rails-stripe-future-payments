class PagesController < ApplicationController
    def index
    end

    def checkout
        Stripe.api_key = 'sk_test_51OMCEWFfaI1YjCZRtOI49rFVitnTumaC5ZdTue3UgVLfFAJBOULCqIobnLI1lGKj9cPlaycnSI3XiW7B9aOUhwtP00XGX5xiEI'

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
