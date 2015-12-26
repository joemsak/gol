module Gol
  class Location
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def adjacent?(other_location)
      other_location.near_coordinates?(x, y)
    end

    def near_coordinates?(x, y)
      (
        (self.x - 1 == x || self.x == x || self.x + 1 == x) &&
          (self.y - 1 == y || self.y + 1 == y)
      ) || (
        (self.x - 1 == x || self.x + 1 == x) &&
          (self.y - 1 == y || self.y == y || self.y + 1 == y)
      )
    end
  end
end
