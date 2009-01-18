require 'rubygems'
gem 'sinatra', '~> 0.3.3'
require 'sinatra'

configure do
  require File.join(File.dirname(__FILE__), 'config', 'world.rb')
end

helpers do
  def link_to(url, text)
    %(<a href="#{url}">#{text}</a>)
  end
  
  # Usage: partial :foo
  def partial(page, options={})
      erb :milestones, options.merge!(:layout => false)
  end
end

  # index
  get '/' do
    #@projects = Project.all
    erb :index
  end
  
  # create
    
  # 404 and 505
  not_found do
    'This is nowhere to be found'
  end

  error do
    'Sorry there was a nasty error - ' + request.env['sinatra.error'].name
  end
