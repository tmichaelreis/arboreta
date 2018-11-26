# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  age        :integer          not null
#  weight     :decimal(5, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  arboreta_methods :weight, :goal_weight

  def goal_weight
    self.weight - 10
  end

end
