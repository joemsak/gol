module Gol
  module HasLocation
    attr_reader :location
    attr_accessor :neighbors

    def initialize(location)
      @location = location
      @neighbors = []
    end

    def add_neighbor(cell)
      @neighbors << cell
    end
  end
end
