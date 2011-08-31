
require 'rubygems'
require 'mongo'
require 'modules/module'
require 'config'
MODULES = []
MODULE_NAMES.each do |mod_name|
    require 'modules/' + mod_name + '/module'
end

MODULES.each do |mod|
    puts mod.name
end
