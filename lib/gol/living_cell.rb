module Gol
  class LivingCell
    attr_reader :location

    def initialize(location)
       @location = location
    end

    def alive?
      true
    end

    def stays_alive?
      location.neighbors.count == 2
    end
  end
end
