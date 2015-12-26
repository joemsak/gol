module Gol
  class DeadCell
    attr_reader :location

    def initialize(location)
      @location = location
    end

    def coming_to_life?
      location.neighbors.count == 3
    end

    def alive?
      false
    end
  end
end
