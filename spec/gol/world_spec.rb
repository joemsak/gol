require 'spec_helper'

RSpec.describe Gol::World do
  context 'an empty world' do
    it 'stays empty on a tick' do
      world = Gol::World.empty
      world.tick
      expect(world).to be_empty
    end

    it 'is not empty after adding a living cell' do
      world = Gol::World.empty
      world.add_living(double(:cell_location))
      expect(world).not_to be_empty
    end
  end
end
