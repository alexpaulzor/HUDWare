
# Some stubs
class HUDWareModule
  # Validate the given mongo entity.
  # Return true if valid or unknown
  # Return false if invalid
  # entity may be an object or just an id.
  def validate(entity)
    return true
  end

  # Return a list of symbols (:foo) that can be passed to erb. These should have a corresponding foo.erb in views/
  # To keep things pretty, you should put your views in views/<module>/, so if your module is named bar, and your
  # view is named foo, you would return [:'bar/foo']
  # If your module doesn't know what to do with the given entity, return an empty list.
  # entity may be an object or just an id.
  def get_views(entity)
    return []
  end

  def name
    raise "name not implemented"
  end

  # returns a hash of local variables to be passed to erb.
  # entity may be an object or just an id.
  def get_view(viewname, params = nil)
    raise "get_view not implemented"
  end

  def update(params)
    raise "update not implemented"
  end

  def create(params)
    raise "create not implemented"
  end
end
