module Gol
  class DeadCell
    attr_reader :location

    def initialize(location)
      @location = location
    end

    def alive?
      false
    end
  end
end
