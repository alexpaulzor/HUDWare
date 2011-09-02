
class MachineModule < HUDWareModule
    def name
        return "machine"
    end

    def get_view(viewname, entity)
        if viewname == "physical"

        elsif viewname == "details"

        end
        return {:machine => entity}
    end

    def update(entity, params)

    end


end

mod = MachineModule.new
MODULES[mod.name] = mod
