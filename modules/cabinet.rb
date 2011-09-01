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
        if viewname == "cabinets"
            # slots: {cabinet_id => {slotnum => machine}}
            slots = {}
            cabinets = {}
            cabinet_records = DB["cabinet"].find("type" => "cabinet")
            cabinet_records.each do |cabinet|
                if cabinet["height"].nil?
                    cabinet["height"] = "45"
                end
                cabinets[cabinet["_id"]] = cabinet
                puts cabinet.inspect
            end
            machines = DB["machine"].find("cabinet" => {"$exists" => true})
            machines.each do |machine|
                if not slots.has_key?(machine["cabinet"])
                    slots[machine["cabinet"]] = {}
                end
                slots[machine["cabinet"]][machine["slot"]] = machine
            end
            return {:cabinets => cabinets, :slots => slots}
        end
    end
end

mod = CabinetModule.new
MODULES[mod.name] = mod
