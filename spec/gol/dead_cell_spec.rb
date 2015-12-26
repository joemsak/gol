require 'spec_helper'

RSpec.describe Gol::DeadCell do
  it 'does not come to life with 0 neighbors' do
    location = double(:location, neighbors: [])
    cell = Gol::DeadCell.new(location)
    expect(cell.coming_to_life?).to be false
  end

  it 'does not come to life with 1 neighbor' do
    location = double(:location, neighbors: [double(:living_cell)])
    cell = Gol::DeadCell.new(location)
    expect(cell.coming_to_life?).to be false
  end

  it 'does not come to life with 2 neighbors' do
    location = double(:location, neighbors: [double(:living_cell1),
                                             double(:living_cell2)])
    cell = Gol::DeadCell.new(location)
    expect(cell.coming_to_life?).to be false
  end

  it 'comes to life when it has 3 neighbors' do
    location = double(:location, neighbors: [double(:living_cell1),
                                             double(:living_cell2),
                                             double(:living_cell3)])
    cell = Gol::DeadCell.new(location)
    expect(cell.coming_to_life?).to be true
  end
end
