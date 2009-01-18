require 'rubygems'
gem 'activesupport', '~> 2.2'
gem 'sequel',        '~> 2.7'
gem 'ruby2ruby'

require 'sequel'
require 'ruby2ruby'

# Mmm, timezones
require 'active_support/basic_object'
require 'active_support/time_with_zone'
require 'active_support/values/time_zone'
require 'active_support/core_ext/object'
require 'active_support/core_ext/date'
require 'active_support/core_ext/numeric'
require 'active_support/core_ext/time'
require 'active_support/duration'
require 'active_support/core_ext/integer/time'
class Integer #:nodoc:
  include ActiveSupport::CoreExtensions::Integer::Time
end

module World
  class << self
    attr_accessor :time_zone

    def init
      yield if block_given?
      #%w().each { |l| require "frailty/#{l}" }
      Time.zone = time_zone
    end
  end

  self.time_zone = "UTC"
end

require 'world/schema'
