require('sinatra')
require('sinatra/reloader')
require('.lib/word')
require(',lib/definition')
require('pry')
also_reload('lib/**/*.rb')

