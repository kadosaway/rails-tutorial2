class Molecule::Comment < At
  include Belongable
  
  has_explanation
  has_name  
  has_user
end
