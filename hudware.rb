
require 'rubygems'
require 'mongo'
require 'modules/module'
require 'config'
require 'sinatra'

MODULES = {}
MODULE_NAMES.each do |mod_name|
    require 'modules/' + mod_name + '/module'
end

get '/v/:module/:view' do
    erb :"#{params[:module]}/#{params[:view]}", {}, MODULES[params[:module]].get_view(params[:view])
end

