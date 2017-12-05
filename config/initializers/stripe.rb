Rails.configuration.stripe = {
  # publishable_key: ENV['PUBLISHABLE_KEY'],
  # secret_key:      ENV['SECRET_KEY']
  publishable_key: "pk_test_7al5ooTjTHTejcEQl0NOt7PI",
  secret_key:      "sk_test_hiRuHCTx21o0nLe3krJs6fg7"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]