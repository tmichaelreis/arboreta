# == Schema Information
#
# Table name: arboreta_trees
#
#  id           :integer          not null, primary key
#  subject_id   :integer
#  subject_type :integer
#  tree_name    :string
#  template     :boolean          default(FALSE)
#

require 'spec_helper'

RSpec.describe Arboreta::Tree, type: :model do

  let(:user) { FactoryBot.create(:user) }

  it 'should support instantiation' do
    expect(Arboreta::Tree.new).to be_instance_of(Arboreta::Tree)
  end

  it 'should be valid without a subject' do
    expect(Arboreta::Tree.new()).to be_valid
  end

  it 'should allow user as the subject' do
    expect(Arboreta::Tree.new(subject: user)).to be_valid
  end

end
