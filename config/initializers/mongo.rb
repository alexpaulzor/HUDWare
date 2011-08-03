MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = "#HUDWare-#{Rails.env}"

if defined?(PhusionPassenger)
    PhussionPassenger.on_event(:starting_worker_process) do |forked|
        MongoMapper.connection.connect if forked
    end
end
