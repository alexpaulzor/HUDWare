
class MachineModule < HUDWareModule
    def name
        return "machine"
    end

    def get_view(viewname, params = nil)
        puts params.inspect
        if viewname == "physical" or viewname == "details" or viewname == "edit"
            machine = DB["machine"].find("_id" => BSON::ObjectId(params[:id])).first
            return {:machine => machine}
        elsif viewname == "create"
            cabinetid = params[:cabinetid]
            slot = params[:slot].to_i
            # TODO: refactor to a cabinets module method
            cabinets = {}
            cabinet_records = DB["cabinet"].find
            cabinet_records.each do |cabinet|
                cabinets[cabinet["_id"]] = cabinet
            end
            # TODO: refactor roles to a cabinets module method
            return {:cabinets => cabinets, :cabinetid => cabinetid, :slot => slot, :roles => {0 => "Regular"}}


        end
    end

    def update(params)

    end

    def create(params)
        return DB["machine"].insert(params[:machine]).to_s
    end


end

mod = MachineModule.new
MODULES[mod.name] = mod
