class Model < ActiveRecord::Base
  self.abstract_class = true
  
  class << self
    
    
    def decorator_class
      "#{name}Decorator".constantize 
    end
    
    def has_explanation
      has_one(:rel_explanation, class_name: Txt::Explanation.name, as: :belong, inverse_of: :belong)
      
      accepts_nested_attributes_for :rel_explanation
      
      define_method :instance_explanation do
        @instance_explanation ||= rel_explanation||build_rel_explanation
      end
      
      define_method :explanation do
        instance_explanation.value
      end

      define_method :explanation= do |str|
        instance_explanation.value = str
      end      
    end
    
    def has_name
      has_one(:rel_name, class_name: Str::Polymophic.name, as: :belong, inverse_of: :belong)
      
      accepts_nested_attributes_for :rel_name
      
      define_method :instance_name do
        @intance_name ||= rel_name || build_rel_name
      end
      
      define_method :name= do |str|
        instance_name.value = str
      end
      
      define_method :name do
        instance_name.value
      end
    end
    
    def has_comments
      has_many :comments, class_name: Molecule::Comment.name, as: :belong, inverse_of: :belong
      
      accepts_nested_attributes_for :comments
    end
    
    def has_user
      delegate :user_id, :user_id=, :user, :user=, to: :instance_user
      has_one :rel_user, class_name: Rel::User.name, as: :f, inverse_of: :f
      
      accepts_nested_attributes_for :rel_user
      
      define_method :instance_user do
        @instance_user ||= rel_user || build_rel_user    
      end
    end
  end
end
