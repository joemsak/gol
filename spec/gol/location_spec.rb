require 'spec_helper'

RSpec.describe Gol::Location do
  it 'is 2-dimensional' do
    location = Gol::Location.new(1, 2)
    expect(location.x).to eq(1)
    expect(location.y).to eq(2)
  end

  describe '#adjacent?' do
    let(:location) { Gol::Location.new(0, 0) }

    let(:left) { Gol::Location.new(-1, 0) }
    let(:right) { Gol::Location.new(1, 0) }
    let(:top_right) { Gol::Location.new(1, 1) }
    let(:bottom_left) { Gol::Location.new(-1, -1) }
    let(:top_left) { Gol::Location.new(-1, 1) }
    let(:bottom_right) { Gol::Location.new(1, -1) }
    let(:bottom) { Gol::Location.new(0, -1) }
    let(:top) { Gol::Location.new(0, 1) }

    it 'includes locations 1 unit away in all directions' do
      [left, right, top_right, bottom_left,
       top_left, bottom_right, bottom, top].each do |adjacent|
        expect(location.adjacent?(adjacent)).to be true
      end

      far_away = Gol::Location.new(2, 0)
      expect(location.adjacent?(far_away)).to be false
      expect(location.adjacent?(location)).to be false
    end
  end
end
