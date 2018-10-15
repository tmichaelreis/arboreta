require 'spec_helper'

RSpec.describe Arboreta::Node do

  it 'should support instantiation' do
    expect(Arboreta::Node.new).to be_instance_of(Arboreta::Node)
  end

  it 'should be invalid without operator' do
    expect(Arboreta::Node.new).to_not be_valid
  end

  describe 'non-leaf node' do
    it 'should be invalid with no children' do
      expect(Arboreta::Node.new(operator: 'AND')).to_not be_valid
    end

    it 'should be invalid without both children' do
      leaf_node = FactoryBot.create(:arboreta_node, :leaf)
      expect(Arboreta::Node.new(operator: 'AND', positive_child: leaf_node)).to_not be_valid
    end
  end

  describe 'leaf node' do
    let(:tree) { FactoryBot.create(:arboreta_tree) }

    it 'should be valid without children' do
      expect(Arboreta::Node.new(operator: 'NOTHING', is_leaf: true, arboreta_tree: tree)).to be_valid
    end
  end

end
