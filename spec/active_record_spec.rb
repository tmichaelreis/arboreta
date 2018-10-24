require 'spec_helper'

RSpec.describe Arboreta::ActiveRecord do

  it 'builds a list of arboreta methods' do
    expect(User.arboreta_whitelist).to include(:weight, :goal_weight)
  end

  it 'does not include non-whitelisted methods in whitelist' do
    expect(User.arboreta_whitelist).to_not include(:name)
  end

end
