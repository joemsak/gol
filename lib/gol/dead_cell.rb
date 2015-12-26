module Gol
  class DeadCell
    include HasLocation

    def alive_after_tick?
      neighbors.count == 3
    end

    def alive?
      false
    end
  end
end
