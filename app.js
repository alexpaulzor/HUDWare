
modules = [];

//TODO: include all modules that we want to use
function load_module(mod_name) {
    $.getScript("modules/" + mod_name + "/" + mod_name + ".js");
}

load_module("machine");
load_module("cabinets");



//Start the app
db = new CouchDB("hudwhere", null);
