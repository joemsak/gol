require 'spec_helper'

RSpec.describe Gol::LivingCell do
  it 'will die on the tick when it has no living neighbors' do
    location = double(:location, neighbors: [])
    cell = Gol::LivingCell.new(location)
    expect(cell.stays_alive?).to be false
  end

  it 'will die on the tick when it has 1 living neighbor' do
    location = double(:location, neighbors: [double(:living_cell)])
    cell = Gol::LivingCell.new(location)

    expect(cell.stays_alive?).to be false
  end

  it 'will stay alive on the tick when it has 2 neighbors' do
    location = double(:location, neighbors: [double(:living_cell1),
                                             double(:living_cell2)])
    cell = Gol::LivingCell.new(location)

    expect(cell.stays_alive?).to be true
  end

  it 'will stay alive on the tick when it has 3 neighbors' do
    location = double(:location, neighbors: [double(:living_cell1),
                                             double(:living_cell2),
                                             double(:living_cell3)])
    cell = Gol::LivingCell.new(location)

    expect(cell.stays_alive?).to be true
  end
end

