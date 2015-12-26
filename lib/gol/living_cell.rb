module Gol
  class LivingCell
    include HasLocation

    def alive?
      true
    end

    def alive_after_tick?
      !under_populated? && !over_populated?
    end

    private
    def under_populated?
      neighbors.count <= 1
    end

    def over_populated?
      neighbors.count > 3
    end
  end
end
