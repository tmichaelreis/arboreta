require 'spec_helper'

RSpec.describe Arboreta::TemplateCopyService do

  let(:user) { FactoryBot.create(:user) }
  let!(:tree_template) { FactoryBot.create(:arboreta_tree_template, :with_nodes) }

  it 'should create new tree' do
    expect do
      described_class.copy_from_template_to_subject(template: tree_template, subject: user)
    end.to change(Arboreta::Tree, :count).by(1)
  end

  it 'should assign correct tree subject' do
    described_class.copy_from_template_to_subject(template: tree_template, subject: user)
    expect(Arboreta::Tree.where(subject_id: user.id).count).to eq(1)
  end

  it 'should create new nodes' do
    template_node_count = tree_template.arboreta_nodes.count

    expect do
      described_class.copy_from_template_to_subject(template: tree_template, subject: user)
    end.to change(Arboreta::Node, :count).by(template_node_count)
  end
end
