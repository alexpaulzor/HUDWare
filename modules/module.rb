
# Some stubs
class HUDWareModule
  # Validate the given mongo entity.
  # Return true if valid or unknown
  # Return false if invalid
  def validate(entity)
    return true
  end

  # Return a list of symbols (:foo) that can be passed to erb. These should have a corresponding foo.erb in views/
  # To keep things pretty, you should put your views in views/<module>/, so if your module is named bar, and your
  # view is named foo, you would return [:'bar/foo']
  # If your module doesn't know what to do with the given entity, return an empty list.
  def get_views(entity)
    return []
  end

  def name
    raise "Name not implemented"
  end

  def get_view(viewname, entity)
    erb :"#{self.name}/#{viewname}"
  end
end
