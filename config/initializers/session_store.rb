# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_inventory_session',
  :secret      => 'bab49347d1dac63f7ed1550cb5f329cbfe013494e8addb6609df784ed66c197b54e335382bb100a103581bacf954a3f364d6df25827ff3138a1309b6a8ea5d30'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
