# By default Volt generates this controller for your Main component
class MainController < Volt::ModelController
  model :page
  
  def todos 
    self.model = :store
  end
  
  def index
    # Add code for when the index view is loaded
  end

  def about
    # Add code for when the about view is loaded
  end

  def num_completed
    _todos.count {|v| v._complete.true? }
  end

  def new
    page._new_todo = _todos.buffer
  end
  
  def add_todo
    page._new_todo.save!.then do
      new
    end
  end

  def remove_todo(todo)
    self._todos.delete(todo)
  end

  private

  # The main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  # Determine if the current nav component is the active one by looking
  # at the first part of the url against the href attribute.
  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end
end
