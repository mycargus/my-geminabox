# my geminabox server

See these resources for details:

<https://guides.rubygems.org/run-your-own-gem-server/>

<https://github.com/geminabox/geminabox>

## Run the server

```sh
docker build -t geminabox .
docker run --rm -p 9292:9292 geminabox:latest
```

## Push to the server

```sh
gem push my-awesome-gem-1.0.gem --host http://localhost:9292
```


## Pull from the server

If using bundler:

```ruby
# Gemfile

source "http://localhost:9292"
...
```

### Add my local geminabox server to my system-wide gem sources

```sh
gem sources --add http://localhost:9292
gem install my-awesome-gem
```
