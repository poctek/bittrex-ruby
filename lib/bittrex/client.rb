# frozen_string_literal: true

require 'rest-client'
require 'faraday'
require 'base64'
require 'json'
require 'openssl'

module Bittrex
  class Client
    attr_reader :key, :secret, :host

    def prefix
      '/api/v1.1'
    end

    def initialize(attrs = {})
      @key = attrs[:key]
      @secret = attrs[:secret]
      @host = attrs[:host] || 'https://api.bittrex.com'
    end

    def get(path, options = {})
      params = options.dup
      read_timeout, open_timeout = params.delete(:read_timeout){3}, params.delete(:open_timeout){2}

      nonce = Time.now.to_i
      query1 = Faraday::Utils::ParamsHash[:apikey, key, :nonce, nonce].to_query(Faraday::FlatParamsEncoder)
      query2 = Faraday::Utils::ParamsHash.new.merge!(params).to_query(Faraday::FlatParamsEncoder)
      query = [query1, query2].compact.reject{|i| i.empty?} * '&'
      url = ["#{host}#{prefix}/#{path}",query].compact * '?'

      response = RestClient::Request.execute(method: :get, url: url, headers: {apisign: signature(url)}, open_timeout: open_timeout, read_timeout: read_timeout)

      json = JSON.parse(response.body)
      raise json.to_s unless json['success']
      json['result']
    end

    def post(path, options = {})
      params = options.dup
      read_timeout, open_timeout = params.delete(:read_timeout){10}, params.delete(:open_timeout){5}

      nonce = Time.now.to_i
      query1 = Faraday::Utils::ParamsHash[:apikey, key, :nonce, nonce].to_query(Faraday::FlatParamsEncoder)
      query = [query1].compact.reject(&:empty?) * '&'
      url = ["#{host}#{prefix}/#{path}",query].compact * '?'

      # response = RestClient.post(url, params, apisign: signature(url))
      response = RestClient::Request.execute(method: :post, url: url, payload: params, headers: {apisign: signature(url)}, open_timeout: open_timeout, read_timeout: read_timeout)

      json = JSON.parse(response.body)
      raise json.to_s unless json['success']
      json['result']
    end

    protected

    def signature(url)
      ::OpenSSL::HMAC.hexdigest 'sha512', secret, url
    end

    def connection
      @connection ||= Faraday.new(:url => HOST) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
