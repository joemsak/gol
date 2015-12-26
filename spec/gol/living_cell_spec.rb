require 'spec_helper'

RSpec.describe Gol::LivingCell do
  it 'will die on the tick when it has no living neighbors' do
    location = double(:location, neighbors: [])
    cell = Gol::LivingCell.new(location)
    expect(cell.stays_alive?).to be false
  end

  it 'will die on the tick when it has 1 living neighbor' do
    neighbor = Gol::LivingCell.new(double(:location))

    location = double(:location, neighbors: [neighbor])
    cell = Gol::LivingCell.new(location)

    expect(cell.stays_alive?).to be false
  end

  it 'will stay alive on the tick when it has 2 neighbors' do
    neighbor1 = Gol::LivingCell.new(double(:location))
    neighbor2 = Gol::LivingCell.new(double(:location))

    location = double(:location, neighbors: [neighbor1, neighbor2])
    cell = Gol::LivingCell.new(location)

    expect(cell.stays_alive?).to be true
  end
end

