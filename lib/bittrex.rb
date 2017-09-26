require 'bittrex/version'
require 'logger'

module Bittrex
  autoload :Market, 'bittrex/market'
  autoload :Client, 'bittrex/client'
  autoload :Clientable, 'bittrex/clientable'
  autoload :Configuration, 'bittrex/configuration'
  autoload :Currency, 'bittrex/currency'
  autoload :Deposit, 'bittrex/deposit'
  autoload :Order, 'bittrex/order'
  autoload :Quote, 'bittrex/quote'
  autoload :Summary, 'bittrex/summary'
  autoload :Wallet, 'bittrex/wallet'
  autoload :Withdrawl, 'bittrex/withdrawl'
  autoload :Api, 'bittrex/api'

  class << self
    def client
      @client ||= Client.new(configuration.auth)
    end

    def config
      yield configuration
      @client = Client.new(configuration.auth)
    end

    def configuration
      Configuration.instance
    end

    def root
      File.expand_path('../..', __FILE__)
    end

    def logger
      @logger ||= Logger.new((ENV['BITTREX_LOGGER'] == 'true') ? STDOUT : nil)
    end

    def logger=(logger)
      @logger = logger
    end
  end
end
