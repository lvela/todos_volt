class TodosController < Volt::ModelController
  model :page

  def todos 
    self.model = :store
  end

  def add_todo
    self._todos << page._new_todo
    page._new_todo = {}
  end
end
