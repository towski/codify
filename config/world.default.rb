$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'frailty'

Frailty.init do
  # Sequel::Model.db = Sequel.connect('mysql://localhost/lost')
  Sequel::Model.db = Sequel.sqlite
  # in memory DB by default, so loading schema
  Frailty.setup_schema

  Frailty.time_zone        = "Eastern Time (US & Canada)"
end