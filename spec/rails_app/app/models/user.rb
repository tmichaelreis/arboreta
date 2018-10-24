class User < ApplicationRecord

  arboreta_methods :weight, :goal_weight

  def goal_weight
    self.weight - 10
  end

end
