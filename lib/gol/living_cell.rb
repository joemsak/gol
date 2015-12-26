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
      !under_populated? && !over_populated?
    end

    private
    def under_populated?
      location.neighbors.count <= 1
    end

    def over_populated?
      location.neighbors.count > 3
    end
  end
end
