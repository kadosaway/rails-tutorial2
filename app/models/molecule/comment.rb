class Molecule::Comment < At
  include Belongable

  belong_topic
  has_explanation
  has_name
  has_user
end
