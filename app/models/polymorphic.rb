class Polymorphic < Model
  include Belongable
  
  self.abstract_class = true
end
