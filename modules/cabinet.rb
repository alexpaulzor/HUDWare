class CabinetModule < HUDWareModule
    def name
        return "cabinet"
    end

    def get_view(viewname, params = nil)
        if viewname == "cabinets"
            # slots: {cabinet_id => {slotnum => machine}}
            slots = {}
            cabinets = {}
            cabinet_records = DB["cabinet"].find
            cabinet_records.each do |cabinet|
                if cabinet["height"].nil?
                    cabinet["height"] = "45"
                end
                cabinets[cabinet["_id"].to_s] = cabinet
            end
            machines = DB["machine"].find("cabinet" => {"$exists" => true})
            machines.each do |machine|
                if not slots.has_key?(machine["cabinet"])
                    slots[machine["cabinet"]] = {}
                end
                slots[machine["cabinet"]][machine["slot"].to_i] = machine
            end
            return {:cabinets => cabinets, :slots => slots}
        elsif viewname == "edit"
            cabinet = DB["cabinet"].find("_id" => BSON::ObjectId(params[:id])).first
            return {:cabinet => cabinet}
        end
    end

    def update(params)
        id = params[:id]
        entity = DB["cabinet"].find("_id" => BSON::ObjectId(id)).first
        entity["name"] = params[:name]
        entity["height"] = params[:height]

        DB["cabinet"].update({"_id" => id}, entity)
    end

    def create(params)
        entity = {}
        entity["name"] = params[:name]
        entity["height"] = params[:height]
        return DB["cabinet"].insert(entity).to_s
    end
end

mod = CabinetModule.new
MODULES[mod.name] = mod
