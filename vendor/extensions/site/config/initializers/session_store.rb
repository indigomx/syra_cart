# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_SyraFinal_session',
  :secret      => 'e0bad72543eece2d1cf0c9bf2f2f9215c2e7256265122326dc7f7a4f25f5aff3ef0a4aa6148c719e630717d13c16141759221ab2c8622c4969a6a3541159de7e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store