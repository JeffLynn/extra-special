# Be sure to restart your server when you modify this file.
# JL 2013.07.03 Changed "config.secret_token" to "config.secret_token" after error in  "$ rails server" saying that method not found

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.config.secret_token = '8854ff6bdf13858acb8afd0cfd90c61f3f62c52884a15e5d4307e362427e5f6836899bf55af262ab1a7d9ea3b4ca657bd01de6e155078eb834377dcdca9ef4a8';
