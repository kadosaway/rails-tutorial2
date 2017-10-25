class Rel < ActiveRecord::Base
  belongs_to :f, polymorphic: true
  belongs_to :l, polymorphic: true
end
