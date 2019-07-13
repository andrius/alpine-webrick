#!/usr/bin/env ruby

require 'bundler'
Bundler.setup
Bundler.require
require 'pp'

set :bind, "0.0.0.0"
set :port, 8000

get /\S*/ do
  $stderr.puts "\nGET: #{params.pretty_inspect}"
  nil
end

post /\S*/ do
  $stderr.puts "\nPOST: #{params.pretty_inspect}"
  nil
end

put /\S*/ do
  $stderr.puts "\nPUT: #{params.pretty_inspect}"
  nil
end

patch /\S*/ do
  $stderr.puts "\nPATCH: #{params.pretty_inspect}"
  nil
end

delete /\S*/ do
  $stderr.puts "\nDELETE: #{params.pretty_inspect}"
  nil
end

options /\S*/ do
  $stderr.puts "\nOPTIONS: #{params.pretty_inspect}"
  nil
end

link /\S*/ do
  $stderr.puts "\nLINK: #{params.pretty_inspect}"
  nil
end

unlink /\S*/ do
  $stderr.puts "\nUNLINK: #{params.pretty_inspect}"
  nil
end
