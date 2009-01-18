$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'world'

Sequel::Model.db = Sequel.sqlite
World.setup_schema
World.init
require 'world/person'

gem 'rr', '~> 0.6'
gem 'jeremymcanally-context' # sudo gem install jeremymcanally-context --source=http://gems.github.com
gem 'jeremymcanally-matchy'  # sudo gem install jeremymcanally-matchy  --source=http://gems.github.com

require 'rr'
require 'context'
require 'matchy'
require 'logger'

# Sequel::Model.db.logger = Logger.new(STDOUT)
Time.zone = "Eastern Time (US & Canada)"

class Test::Unit::TestCase
  include RR::Adapters::TestUnit

  def self.transaction(&block)
    Sequel::Model.db.transaction &block
  end

  def transaction(&block)
    self.class.transaction(&block)
  end

  def cleanup(*models)
    transaction { models.each { |m| m.delete_all } }
  end
end

begin
  require 'ruby-debug'
  Debugger.start
rescue LoadError
end
