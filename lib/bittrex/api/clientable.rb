module Bittrex
  module Api
    module Clientable
      def self.included(base)
        base.extend SingleForwardable
        base.def_single_delegator :Bittrex, :client
      end
    end
  end
end

