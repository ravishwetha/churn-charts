#!/usr/bin/env ruby

require 'sinatra'
require 'json'
require 'date'
require './lib/helper.rb'

helpers Helper

get '/' do
  erb :index
end

get '/timeline' do
  erb :timeline
end

get '/data.js' do
  content_type :json
  flatten_entries(aggregate_churn(read_log())).to_json
end