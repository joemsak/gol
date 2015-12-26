require 'spec_helper'

RSpec.describe Gol::World do
  context 'an empty world' do
    it 'stays empty on a tick' do
      world = Gol::World.empty
      world.tick
      expect(world).to be_empty
    end
  end
end
