# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_extra_special_trust_session',
  :secret      => '5051b7e3bdcb37cae39c2a7cbd7bf506d537cb95c28b9b6424f4de2b7b4f0e2fe01e1b47c927f002b23c074d4693472cc280574b690e30e39e961e3a0281ea18'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
