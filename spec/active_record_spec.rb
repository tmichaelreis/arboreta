require 'spec_helper'

RSpec.describe Arboreta::ActiveRecord do

  it 'builds a list of arboreta methods' do
    expect(User.arboreta_whitelist).to include(:weight, :goal_weight)
  end

  it 'does not include non-whitelisted methods in whitelist' do
    expect(User.arboreta_whitelist).to_not include(:name)
  end

  describe '#arboreta_send' do
    let(:user) { FactoryBot.create(:user) }

    it 'should raise an exception if method is not on whitelist' do
      expect{user.arboreta_send('name')}.to raise_error(Arboreta::MethodNotPermittedError)
    end

    it 'should call method if whitelisted' do
      expect(user.arboreta_send('weight')).to eq(user.weight)
    end
  end

end
