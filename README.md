# Bittrex

Unofficial gem for the Bittrex API

## Installation

Add this line to your application's Gemfile:

    gem 'bittrex'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bittrex
    
## Authentication

You can authenticate access to your Bittrex account by configuring your implementation of the bittrex gem. This is accomplished by using a config block at the top of your application.

Set up your keys at: https://bittrex.com/Account/ManageApiKey

```ruby
    Bittrex.config do |c|
      c.key = 'my_api_key'
      c.secret = 'my_api_secret'
    end
```

## Api Usage

### style 1

```ruby
  require 'rubygems'
  require 'bittrex'
  Bittrex::Api::Public.getticker('BTC-LTC')
  # => {"Bid"=>0.010587, "Ask"=>0.01059984, "Last"=>0.01059984}
```

### style 2

```ruby
  require 'rubygems'
  require 'bittrex'
  Bittrex.client.get('public/getticket', 'BTC-LTC')
  # => {"Bid"=>0.010587, "Ask"=>0.01059984, "Last"=>0.01059984}
```

## Run spec
```bash
cp spec/.env.template spec/.env
# fill API_KEY, SECRET_KEY in spec/.env
rspec spec
```

## Contributing

* Check original Source https://github.com/mwerner/bittrex


## Copyright

Copyright (c) 2017 Sangmin Ryu (Works after 2017)

Copyright (c) 2014 Matthew Werner (Original works)
