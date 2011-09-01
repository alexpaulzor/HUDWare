class CabinetModule < HUDWareModule
    def name
        return "cabinet"
    end

    def get_views(entity = nil)
        if entity.nil?
            return ["cabinets", "hud"]
        elsif entity["type"]== "cabinet"
            return ["cabinet"]
        else
            return []
        end
    end


    def get_view(viewname, entity = nil)
        if viewname == "cabinets" or viewname == "hud"
            return {:cabinets => DB["cabinet"].find("type" => "cabinet")}
        elsif viewname == "cabinet"
            if entity["height"].nil?
                entity["height"] = 45
            end
            slots = {}
            1.upto entity["height"] do |i|
                slots[i] = nil
            end
            machines = DB["machine"].find("cabinet" => entity["_id"])
            machines.each do |machine|
                slots[machine["slot"]] = machine
            end

            return {:cabinet => entity, :machines => machines, :slots => slots}
        end
    end
end

mod = CabinetModule.new
MODULES[mod.name] = mod
