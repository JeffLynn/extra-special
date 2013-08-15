# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_help_session',
  :secret      => '9c036526ebe147dc3e0533117c7bc4c3ab7a787c90dd831e683082a32b0c7beb8d8e9249364c7b698ef64e1eb7d448bac264fe7c36635c25b208e09635b5c3da'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
