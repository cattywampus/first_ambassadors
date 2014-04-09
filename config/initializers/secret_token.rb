# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Ambassador::Application.config.secret_key_base = '58081fe71c6c0fc7b63f152b45ffc617b568193c9bc591550d2a50cb7775a259fc943350c73b73d3975098543d4d2853266a0f0b482592bb3b7052840555550a'
