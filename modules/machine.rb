
class MachineModule < HUDWareModule
    def name
        return "machine"
    end

    def get_view(viewname, entity = nil)
        if viewname == "physical"

        elsif viewname == "details"

        elsif viewname == "create"
            cabinetid = nil
            slot = nil
            if entity
                cabinetid, slot = entity.split(".")
            end
            # TODO: refactor to a cabinets module method
            cabinets = {}
            cabinet_records = DB["cabinet"].find
            cabinet_records.each do |cabinet|
                cabinets[cabinet["_id"]] = cabinet
            end
            # TODO: refactor roles to a cabinets module method
            return {:cabinets => cabinets, :cabinetid => cabinetid, :slot => slot, :roles => {0 => "Regular"}}


        end
        return {:machine => entity}
    end

    def update(entity, params)

    end


end

mod = MachineModule.new
MODULES[mod.name] = mod
