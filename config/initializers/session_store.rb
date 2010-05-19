# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tasklist1_session',
  :secret      => 'd76c1bc0ddc199304212ab333b93b6611789ae672afcb3c524338450f5e723cecfecfa2137ff953ef6ac7151d7c7b4ca6f86348ac0168d0a3fe16da2509470ca'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
