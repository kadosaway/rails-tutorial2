module Belongable
  extend ActiveSupport::Concern
  
  included do
    belongs_to :belong, polymorphic: true     
  end
end
