# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_couchrest_example_session',
  :secret      => 'b52fadaa93917f75772461200c7ab8f73dee598691b5e7c77aa347b704b166d430f149f9ebd52c18ffc4a3fcd8dd1f736f57199262deef9da128e8c54e3b9cf8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
