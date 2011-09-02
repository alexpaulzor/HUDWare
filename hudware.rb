
require 'rubygems'
require 'mongo'
require 'modules/module'
require 'config'
require 'sinatra'

MODULES = {}
MODULE_NAMES.each do |mod_name|
    require 'modules/' + mod_name
end

get '/v/:module/:view/:id' do
    erb :"#{params[:module]}/#{params[:view]}", {}, MODULES[params[:module]].get_view(params[:view], params[:id])
end

get '/v/:module/:view' do
    erb :"#{params[:module]}/#{params[:view]}", {}, MODULES[params[:module]].get_view(params[:view])
end

post '/update/:module/:id' do
    MODULES[params[:module]].update(params[:id], params)
    erb :"#{params[:module]}/#{params[:nextview]}", {}, MODULES[params[:module]].get_view(params[:nextview], params[:id])
end

post '/create/:module' do
    entity = MODULES[params[:module]].create(params)
    erb :"#{params[:module]}/#{params[:nextview]}", {}, MODULES[params[:module]].get_view(params[:nextview], entity)
end

