ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'sinatra/partial'

require_relative 'server'

require_relative 'controllers/init'
