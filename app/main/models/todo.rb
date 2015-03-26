class Todo < Volt::Model
  validate :label, length: 10
end
