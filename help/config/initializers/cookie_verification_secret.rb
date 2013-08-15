# Be sure to restart your server when you modify this file.
# JL 2013.07.03 Changed "config.secret_token" to "config.secret_token" after error in  "$ rails server" saying that method not found

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.config.secret_token = 'a1c11f7a1ac6f870b4a1d00a5f922cf1990e8091685dbba16e9884c0dfb0563bd3dfdf1a01397926ebb39d1dcb1a9b36c23a47c8f9d59f9cc980654da0a7733d';
