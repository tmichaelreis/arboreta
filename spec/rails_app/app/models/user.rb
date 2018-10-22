class User < ApplicationRecord
  def goal_weight
    self.weight - 10
  end
end
