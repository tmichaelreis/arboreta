require 'spec_helper'

RSpec.describe Arboreta::Node do

  it 'should support instantiation' do
    expect(Arboreta::Node.new).to be_instance_of(Arboreta::Node)
  end

end
