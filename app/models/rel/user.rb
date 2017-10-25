class Rel::User < Rel
  
  def user_id=(user_id)
    self.l = User.find_by id: user_id
  end
  
  def user_id
    l_id
  end
  
  alias :user :l
  alias :user= :l=
end
