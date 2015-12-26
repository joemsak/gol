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

  context 'a world with one living cell in it' do
    it 'becomes empty on the next tick' do
      world = Gol::World.empty
      location = double(:location, neighbors: [])

      world.add_living(location)
      world.tick

      expect(world).to be_empty
    end
  end

  context 'a world with a dead cell and 3 living neighbors who have no neighbors' do
    it 'results in one living cell' do
      world = Gol::World.empty

      lonely_location = double(:location, neighbors: [])

      neighbor1 = Gol::LivingCell.new(lonely_location)
      neighbor2 = Gol::LivingCell.new(lonely_location)
      neighbor3 = Gol::LivingCell.new(lonely_location)

      location = double(:location, neighbors: [neighbor1, neighbor2, neighbor3])

      world.add_dead(location)
      world.tick

      expect(world.living_cells.count).to eq(1)
    end
  end
end
