# see https://github.com/geminabox/geminabox#server-setup

require "rubygems"
require "geminabox"

Geminabox.data = ENV.fetch('DOCKER_DATA_STORE', 'gem/data')
Geminabox.rubygems_proxy = true
Geminabox.allow_remote_failure = true

# Use Rack::Protection to prevent XSS and CSRF vulnerability if your geminabox server is open public.
# Rack::Protection requires a session middleware, choose your favorite one such as Rack::Session::Memcache.
# This example uses Rack::Session::Pool for simplicity, but please note that:
# 1) Rack::Session::Pool is not available for multiprocess servers such as unicorn
# 2) Rack::Session::Pool causes memory leak (it does not expire stored `@pool` hash)
# use Rack::Session::Pool, expire_after: 1000 # sec
# use Rack::Protection

run Geminabox::Server
