class Molecule::Cal < At
  include Belongable

  has_date
  belong_topic
  has_explanation
  has_name
  has_user
end