class CabinetModule < HUDWareModule
    def name
        return "cabinet"
    end

    def get_view(viewname, entity = nil)
        if viewname == "cabinets"
            # slots: {cabinet_id => {slotnum => machine}}
            slots = {}
            cabinets = {}
            cabinet_records = DB["cabinet"].find
            cabinet_records.each do |cabinet|
                if cabinet["height"].nil?
                    cabinet["height"] = "45"
                end
                cabinets[cabinet["_id"]] = cabinet
            end
            machines = DB["machine"].find("cabinet" => {"$exists" => true})
            machines.each do |machine|
                if not slots.has_key?(machine["cabinet"])
                    slots[machine["cabinet"]] = {}
                end
                slots[machine["cabinet"]][machine["slot"]] = machine
            end
            return {:cabinets => cabinets, :slots => slots}
        elsif viewname == "edit"
            if entity["_id"]
                return {:cabinet => entity}
            else
                cabinet = DB["cabinet"].find("_id" => BSON::ObjectId(entity)).first
                return {:cabinet => cabinet}
            end
        end
    end

    def update(entity, params)
        id = entity["_id"]
        if not id
            id = BSON::ObjectId(entity)
            entity = DB["cabinet"].find("_id" => id).first
        end
        entity["name"] = params[:name]
        entity["height"] = params[:height]

        DB["cabinet"].update({"_id" => id}, entity)
    end

    def create(params)
        entity = {}
        entity["name"] = params[:name]
        entity["height"] = params[:height]
        return DB["cabinet"].insert(entity)
    end
end

mod = CabinetModule.new
MODULES[mod.name] = mod
