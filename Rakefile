require 'rubygems'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
end

desc "Default task is to run specs"
task :default => :test

namespace :frailty do
  task :init do
    require File.join(File.dirname(__FILE__), 'config', 'lost.rb')
  end

  desc "Reset DB schema"
  task :schema => :init do
    Frailty.setup_schema
  end
end