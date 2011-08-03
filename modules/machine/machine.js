
var machine_module = new MachineModule();
modules.push(machine_module);

function MachineModule() {
    this.install = function() {
        //TODO
    }

    this.get_views = function(entity) {
        //TODO
        return [];
    }

    this.validate = function(entity) {
        //TODO
        return true;
    }

    this.views = {"details": {"map": function(doc) {
    if (doc.type == "machine") {

}
