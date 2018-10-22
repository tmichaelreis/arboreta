# == Schema Information
#
# Table name: arboreta_nodes
#
#  id                :integer          not null, primary key
#  input_data        :jsonb
#  operator          :string           not null
#  is_root           :boolean          default(FALSE)
#  is_leaf           :boolean
#  positive_child_id :integer
#  negative_child_id :integer
#  arboreta_tree_id  :integer
#

require 'spec_helper'

RSpec.describe Arboreta::Node do
  let(:user) { FactoryBot.create(:user) }
  let(:tree) { FactoryBot.create(:arboreta_tree, subject: user) }

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
    it 'should be valid without operator' do
      expect(Arboreta::Node.new(is_leaf: true, arboreta_tree: tree)).to be_valid
    end
  end

  describe 'chained execution' do
    it 'should execute positive child node if positive outcome' do
      positive_child = Arboreta::Node.create(is_leaf: true, arboreta_tree: tree)
      negative_child = Arboreta::Node.create(is_leaf: true, arboreta_tree: tree)

      truthy_inputs = [
        {
          comparison: 'eq',
          left_method: 'name',
          right_method: 'name'
        },
        {
          comparison: 'gt',
          left_method: 'weight',
          right_method: 'goal_weight'
        }
      ]

      node = FactoryBot.create(:arboreta_node,
                               arboreta_tree: tree,
                               operator: 'AND',
                               input_data: truthy_inputs,
                               positive_child: positive_child,
                               negative_child: negative_child)

      expect(positive_child).to receive(:execute!)
      node.execute!
    end

    it 'should execute negative child node if negative outcome' do
      positive_child = Arboreta::Node.create(operator: 'NOTHING', is_leaf: true, arboreta_tree: tree)
      negative_child = Arboreta::Node.create(operator: 'NOTHING', is_leaf: true, arboreta_tree: tree)

      falsey_inputs = [
        {
          comparison: 'eq',
          left_method: 'name',
          right_method: 'name'
        },
        {
          comparison: 'lt',
          left_method: 'weight',
          right_method: 'goal_weight'
        }
      ]

      node = FactoryBot.create(:arboreta_node,
                               arboreta_tree: tree,
                               operator: 'AND',
                               input_data: falsey_inputs,
                               positive_child: positive_child,
                               negative_child: negative_child)

      expect(negative_child).to receive(:execute!)
      node.execute!
    end
  end

end
