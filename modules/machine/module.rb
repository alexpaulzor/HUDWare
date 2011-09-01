
class MachineModule < HUDWareModule
    def name
        return "machine"
    end


end

mod = MachineModule.new
MODULES[mod.name] = mod
