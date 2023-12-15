Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_51OAJsuDF20wsDfNZdJk1bm13UqASfVEmFEav2aIPrdB8d1T7LsBxwR3cjmLem7UT4WTHlawLCgnBcmxxb2CWN9xe00DS69ht2s'],
  secret_key: ENV['sk_test_51OAJsuDF20wsDfNZI7ky3T3MxMofEJe3hJ5QIAsYcxg8NtNn2MFhqcT2H7Y9KcGdfqGv85RB53rrjo6zWJGHZw0m00vVNT2yau']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
