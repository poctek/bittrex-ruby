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

## Raw Api Usage (Recomended)

```
    require 'rubygems'
    require 'bittrex'
    >> Bittrex::Api::Public.getticker('BTC-LTC')
    > {"Bid"=>0.010587, "Ask"=>0.01059984, "Last"=>0.01059984}
```

## Model Usage (Not Recommended)

The gem uses a simple mapping of API resources to models, with a majority of the attributes mapped to corresponding attributes on the corresponding class. There are some translations into a more "rubyish" verbage, but for the most part things are directly mapped.

```
    require 'rubygems'
    require 'bittrex'
    >> Quote.current('BTC-LTC')
    #=> #<Bittrex::Quote:0x000001015cd058 @market="BTC-LTC", @bid=0.015792, @ask=0.01602899, @last=0.015792, @raw={"Bid"=>0.015792, "Ask"=>0.01602899, "Last"=>0.015792}>
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

See [LICENSE][] for details.
